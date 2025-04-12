return function()
  local devicons_present, devicons = pcall(require, "nvim-web-devicons")
  if not devicons_present then
    return
  end

  devicons.setup {
    variant = "light",
  }
end
