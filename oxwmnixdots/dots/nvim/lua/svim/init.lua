require("svim.defaults")

local git = require("svim.git")

vim.api.nvim_create_user_command("Sinstall", function() git.install() end, {})
vim.api.nvim_create_user_command("Supdate",  function() git.update() end, {})
vim.api.nvim_create_user_command("Sclean",   function() git.clean() end, {})

return git
