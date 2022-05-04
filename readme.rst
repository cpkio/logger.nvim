########################
Simple file edits logger
########################

Description
###########

This simple plugin for Neovim logs into a SQLiteDB what you want and when you
want it. For now it logs:

- current buffer name;
- current cursor position;
- human-readable timestamp;
- unix timestamp.

Use autocommands to decide when to make a log entry or log manually by keystroke.

SQLite is good choice because it can write to DB concurrently when a few
Neovim instances are opened.

Requirements
############

1. SQLite library, built for your machine and operating system (SQLite prerequisite)
2. https://github.com/tami5/sqlite.lua

Setup
#####

Define log db path (possibly in your `.lvimrc`, with `vim-localvimrc` plugin) with VimScript:

   let g:logger_db_path = 'D:/drive\ with\ spaces/my_logs.db'

or with Lua in your `init.lua` (Lua `.lvimrc` plugin does not exist AFAIK):

   vim.g.logger_db_path = 'D:/drive\ with\ spaces/my_logs.db'

Use environment variables when needed:

   let g:logger_db_path = $project_dir . '/my_logs.db'

or

   vim.g.logger_db_path = vim.env.project_dir .. '/my_logs.db'

If not defined, 'C:\temp\logs.db' will be used.

Call Lua logging function when needed:

   lua require'logger'.logme()

Use autocommands (possibly in your `.lvimrc`):

   autocmd BufWritePost * lua require'logger'.logme()

License
#######

You can do whatever you want with these few lines of code. PRs are welcome for sure.
