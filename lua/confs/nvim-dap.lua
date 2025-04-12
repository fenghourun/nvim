local dap_present, dap = pcall(require, "dap")
local dapui_present, dap_ui = pcall(require, "dapui")
local dvc_present, dap_vscode_js = pcall(require, "dap-vscode-js")

if not dap_present or not dvc_present or not dapui_present then
  return
end

dap_vscode_js.setup {
  adapters = { "pwa-node", "node-terminal" },
  log_file_path = "(stdpath cache)/dap_vscode_js.log",
  -- log_file_level = vim.log.levels.DEBUG,
  -- log_console_level = vim.log.levels.TRACE,
}

dap.set_log_level "TRACE"

dap.adapters.javascript = {
  type = "executable",
  command = "node",
  args = { "--inspect" },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      address = "127.0.0.1",
      port = "9222",
      continueOnAttach = true,
      websocketAddress = "ws://127.0.0.1:9229",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      args = { "direnv allow .", "npm run devmocha" },
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Mocha Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/mocha/bin/mocha",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
end

-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dap_ui.close()
-- end
--
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dap_ui.close()
-- end
