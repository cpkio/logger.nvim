local has_sqlite, sqlite = pcall(require, 'sqlite')
local julianday, strftime = sqlite.lib.julianday, sqlite.lib.strftime

local db = sqlite {
  uri = vim.g.logger_db_path or 'c:/temp/logs.db',
  logger = {
    action = 'text',
    filename = 'text',
    humantime = 'text',
    timeunix = { 'timestamp', default = strftime("%s", "now") },
    lineedit = 'luatable',
  },
}

local log = db.logger

local function logme(message)
  log:insert({
    action = message or '',
    filename = vim.api.nvim_buf_get_name(0),
    humantime = os.date("%d.%m.%Y %H:%M:%S"),
    lineedit = vim.api.nvim_win_get_cursor(0),
  })
end

return {
  logme = logme
}
