math.randomseed(os.time())

local drafts = require("drafts")
local export = require("export")

vim.api.nvim_create_user_command('DraftNew', drafts.new_draft, {})
vim.api.nvim_create_user_command('DraftMerge', drafts.merge_draft, {})
vim.api.nvim_create_user_command('DraftAbandon', drafts.abandon_draft, {})

vim.api.nvim_create_user_command('ExportPDF', export.export_pdf, { nargs = '+' })
vim.api.nvim_create_user_command('ExportDOCX', export.export_docx, { nargs = '+' })
vim.api.nvim_create_user_command('ExportMD', export.export_md, { nargs = '+' })
