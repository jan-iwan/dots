-- -- -- -- ~~ ~~ # neovim config # ~~ ~~ -- -- -- --
--                                                 --
-- Welcome to my nvim config!                      --
--                                                 --
-- Files inside of '~/.config/nvim/lua' are used   --
-- for configuration in lua. the plugins directory --
-- is sourced and lazy-lodaded by the plugin       --
-- manager, lazy.nvim. There are also some         --
-- snippets which are loaded by the LuaSnip plugin.--
--                                                 --
-- Each lua file inside of 'plugins' corresponds   --
-- to some functionality rather than some specific --
-- plugin.                                         --
--                                                 --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.plugins")
