local present, colorizer = pcall(require, "colorizer")

if not present then return end


colorizer.setup {
  '*'; -- Highlight all files, but customize some others.
}

