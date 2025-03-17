-- Add this to your init.lua or appropriate config file

-- Function to check macOS appearance
-- local function get_macos_appearance()
--     local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
--     if handle then
--         local result = handle:read("*a")
--         handle:close()
--         return result:match("Dark") and "dark" or "light"
--     end
--     return "dark" -- fallback
-- end

-- Function to set the theme
local function set_theme(style)
  vim.cmd('colorscheme tokyonight-' .. style)
end

-- Function to toggle theme manually
local function toggle_theme()
  local current_bg = vim.o.background
  if current_bg == 'dark' then
    set_theme 'day'
    vim.o.background = 'light'
  else
    set_theme 'night'
    vim.o.background = 'dark'
  end

  -- Additional cursor refresh commands
  vim.cmd 'redraw!'
  vim.cmd 'highlight Cursor guifg=NONE guibg=NONE'
  vim.schedule(function()
    -- Re-apply cursor settings after a short delay
    vim.cmd 'highlight! link Cursor Cursor'
  end)
end

-- Set up autocommand to check system appearance periodically
-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function()
--         -- Initial setup based on system appearance
--         local appearance = get_macos_appearance()
--         set_theme(appearance == "dark" and "night" or "day")
--         vim.o.background = appearance == "dark" and "dark" or "light"
--
--         -- Check system appearance every 5 seconds
--         vim.fn.timer_start(5000, function()
--             local new_appearance = get_macos_appearance()
--             if new_appearance == "dark" and vim.o.background ~= "dark" then
--                 set_theme("night")
--                 vim.o.background = "dark"
--             elseif new_appearance ~= "dark" and vim.o.background ~= "light" then
--                 set_theme("day")
--                 vim.o.background = "light"
--             end
--         end, { ['repeat'] = -1 })
--     end
-- })

-- Set up the keybinding for manual toggle (change the mapping as desired)
vim.keymap.set('n', '<leader>tt', toggle_theme, { noremap = true, silent = true })
