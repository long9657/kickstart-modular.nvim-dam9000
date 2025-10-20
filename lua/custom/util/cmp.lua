local M = {}

-- 🧠 Utility: Create undo point in insert mode
M.CREATE_UNDO = vim.api.nvim_replace_termcodes('<C-G>u', true, true, true)
function M.create_undo()
  if vim.api.nvim_get_mode().mode == 'i' then
    vim.api.nvim_feedkeys(M.CREATE_UNDO, 'n', false)
  end
end

-- 🧩 Actions (optional)
M.actions = {
  snippet_forward = function()
    if vim.snippet and vim.snippet.active { direction = 1 } then
      vim.schedule(function() vim.snippet.jump(1) end)
      return true
    end
  end,
  snippet_stop = function()
    if vim.snippet then
      vim.snippet.stop()
    end
  end,
}

---@param actions string[]
---@param fallback? string|fun()
function M.map(actions, fallback)
  return function()
    for _, name in ipairs(actions) do
      if M.actions[name] and M.actions[name]() then
        return true
      end
    end
    if type(fallback) == 'function' then
      return fallback()
    end
    return fallback
  end
end

---@alias Placeholder {n:number, text:string}

function M.snippet_replace(snippet, fn)
  return snippet:gsub('%$%b{}', function(m)
    local n, name = m:match '^%${(%d+):(.+)}$'
    return n and fn { n = n, text = name } or m
  end) or snippet
end

function M.snippet_preview(snippet)
  local ok, parsed = pcall(function() return vim.lsp._snippet_grammar.parse(snippet) end)
  return ok and tostring(parsed) or M.snippet_replace(snippet, function(placeholder) return M.snippet_preview(placeholder.text) end):gsub('%$0', '')
end

function M.snippet_fix(snippet)
  local texts = {}
  return M.snippet_replace(snippet, function(placeholder)
    texts[placeholder.n] = texts[placeholder.n] or M.snippet_preview(placeholder.text)
    return '${' .. placeholder.n .. ':' .. texts[placeholder.n] .. '}'
  end)
end

---@param entry cmp.Entry
function M.auto_brackets(entry)
  local cmp = require 'cmp'
  local Kind = cmp.lsp.CompletionItemKind
  local item = entry:get_completion_item()
  if vim.tbl_contains({ Kind.Function, Kind.Method }, item.kind) then
    local cursor = vim.api.nvim_win_get_cursor(0)
    local prev_char = vim.api.nvim_buf_get_text(0, cursor[1] - 1, cursor[2], cursor[1] - 1, cursor[2] + 1, {})[1]
    if prev_char ~= '(' and prev_char ~= ')' then
      local keys = vim.api.nvim_replace_termcodes('()<Left>', false, false, true)
      vim.api.nvim_feedkeys(keys, 'i', true)
    end
  end
end

-- ✅ Improved confirm
function M.confirm(opts)
  local cmp = require 'cmp'
  opts = vim.tbl_extend('force', {
    select = true,
    behavior = cmp.ConfirmBehavior.Insert,
  }, opts or {})

  return function(fallback)
    if (cmp.visible and cmp.visible()) or vim.fn.pumvisible() == 1 then
      M.create_undo()
      if cmp.confirm(opts) then
        return
      end
    end
    return fallback()
  end
end

return M
