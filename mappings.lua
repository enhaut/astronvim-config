-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    
    ["\\"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<C-w>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<Tab>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-Tab>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },
    ["<leader>tt"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    ["<leader>gi"] = { function() require("gitignore").generate() end, desc = ".gitignore generator" },
    ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    -- folds
    ["<leader>-"] = { ":foldclose<cr>", desc = "Fold block" },
    ["<leader>+"] = { ":foldopen<cr>", desc = "Expand block" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
