########################
Simple file edits logger
########################

Description
###########

This simple plugin for Neovim logs into a SQLiteDB what you want and when you
want it. For now it logs:

- message from ``logme(message)``;
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

Define log db path (possibly in your ``.lvimrc``, with ``vim-localvimrc``
plugin) with VimScript:

   ``let g:logger_db_path = 'D:/drive\ with\ spaces/my_logs.db'``

or with Lua in your ``init.lua`` (Lua-based ``.lvimrc`` plugin does not exist
AFAIK):

   ``vim.g.logger_db_path = 'D:/drive\ with\ spaces/my_logs.db'``

Use environment variables when needed:

   ``let g:logger_db_path = $project_dir . '/my_logs.db'``

or

   ``vim.g.logger_db_path = vim.env.project_dir .. '/my_logs.db'``

If not defined, ``C:\temp\logs.db`` will be used.

Call Lua logging function when needed:

   ``lua require'logger'.logme('my log message')``

Use autocommands (possibly in your ``.lvimrc``):

| ``augroup logs``
| ``au! logs``
| ``autocmd BufReadPost * lua require'logger'.logme('new/open')``
| ``autocmd BufWritePost * lua require'logger'.logme('save')``
| ``autocmd BufUnload * lua require'logger'.logme('close')``
| ``augroup END``

Keep in mind ``BufRead*`` will not fire when autocommand is defined in
``.lvimrc``, and the file is opened with command line. ``vim-localvimrc`` has
to load and start looking for ``.lvimrc`` in current directory, but the file
will be opened already and no autocommand will be defined at that time.

License
#######

You can do whatever you want with these few lines of code. PRs are welcome for
sure.
