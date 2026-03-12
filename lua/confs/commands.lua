vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match "^confs" or name:match "^plugins" or name:match "^theme" then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print "Configuration reloaded!"
end, {})
