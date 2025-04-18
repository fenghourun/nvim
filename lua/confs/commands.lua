vim.api.nvim_create_user_command("ReloadConfig", function()
  for name, _ in pairs(package.loaded) do
    if name:match "^your_prefix" then -- e.g., "config." or "user." or "custom."
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print "Configuration reloaded!"
end, {})
