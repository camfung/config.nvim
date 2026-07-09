-- Transient (preview) buffers.
--
-- A buffer only "sticks" (stays open in the buffer list) if it was opened
-- deliberately: from nvim-tree, from a telescope picker, if you edit it, or if
-- it was restored from a session / passed on the command line.
--
-- Any other buffer -- e.g. one you land on via `gd`, grep results, quickfix --
-- is transient: as soon as you navigate away and it's no longer visible in any
-- window, it gets wiped.

local M = {}

-- bufnr -> true for buffers that should never be auto-wiped.
local sticky = {}

-- Set true when we just left a "launcher" (tree/picker); the next normal file
-- buffer we land on is the file it opened, so mark that one sticky.
local armed = false

-- Buffers you open *from* these become sticky.
local launcher_ft = {
  NvimTree = true,
  TelescopePrompt = true,
  ['neo-tree'] = true,
}

-- Filetypes that are never candidates for wiping (plugin/UI buffers).
local ignore_ft = {
  NvimTree = true,
  TelescopePrompt = true,
  ['neo-tree'] = true,
  oil = true,
  trouble = true,
  qf = true,
  help = true,
  harpoon = true,
  gitcommit = true,
  DiffviewFiles = true,
  DiffviewFileHistory = true,
}

-- Only plain, listed, named file buffers are ever transient.
local function is_normal_file_buf(buf)
  if not (buf and vim.api.nvim_buf_is_valid(buf)) then
    return false
  end
  if vim.bo[buf].buftype ~= '' then
    return false
  end
  if not vim.bo[buf].buflisted then
    return false
  end
  if ignore_ft[vim.bo[buf].filetype] then
    return false
  end
  if vim.api.nvim_buf_get_name(buf) == '' then
    return false
  end
  return true
end

-- Mark a buffer as sticky (kept). Defaults to the current buffer.
function M.mark_sticky(buf)
  buf = buf or vim.api.nvim_get_current_buf()
  if is_normal_file_buf(buf) then
    sticky[buf] = true
  end
end

local function is_transient(buf)
  if sticky[buf] then
    return false
  end
  if not is_normal_file_buf(buf) then
    return false
  end
  if vim.bo[buf].modified then
    return false
  end
  return true
end

local function buf_visible(buf)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == buf then
      return true
    end
  end
  return false
end

-- Mark every currently-listed file buffer as sticky. Used at startup and after
-- a session restore so pre-existing buffers are never treated as previews.
local function mark_all_listed()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted then
      M.mark_sticky(buf)
    end
  end
end

function M.setup()
  local group = vim.api.nvim_create_augroup('transient_buffers', { clear = true })

  vim.api.nvim_create_autocmd('BufLeave', {
    group = group,
    callback = function(args)
      -- Arm if we're leaving a launcher; the file it opens comes next.
      if launcher_ft[vim.bo[args.buf].filetype] then
        armed = true
      end
      -- Wipe the transient buffer we're leaving once it's off-screen.
      local buf = args.buf
      if not is_transient(buf) then
        return
      end
      vim.schedule(function()
        if is_transient(buf) and not buf_visible(buf) then
          pcall(vim.api.nvim_buf_delete, buf, { force = false })
        end
      end)
    end,
  })

  -- Land on a normal file straight after a launcher -> keep it.
  vim.api.nvim_create_autocmd('BufEnter', {
    group = group,
    callback = function(args)
      if not is_normal_file_buf(args.buf) then
        return
      end
      if armed then
        M.mark_sticky(args.buf)
      end
      armed = false
    end,
  })

  -- Promote to sticky the moment you actually touch the buffer.
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'BufModifiedSet', 'BufWritePost' }, {
    group = group,
    callback = function(args)
      if args.event == 'BufModifiedSet' and not vim.bo[args.buf].modified then
        return
      end
      M.mark_sticky(args.buf)
    end,
  })

  -- Drop bookkeeping when a buffer is really gone.
  vim.api.nvim_create_autocmd('BufDelete', {
    group = group,
    callback = function(args)
      sticky[args.buf] = nil
    end,
  })

  -- Buffers already open at startup / restored from a session are kept.
  vim.api.nvim_create_autocmd({ 'VimEnter', 'SessionLoadPost' }, {
    group = group,
    callback = function()
      vim.schedule(mark_all_listed)
    end,
  })
  mark_all_listed()
end

return M
