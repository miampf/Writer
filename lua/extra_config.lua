math.randomseed(os.time())

local drafts = require("drafts")
local export = require("export")

vim.api.nvim_create_user_command('DraftNew', drafts.new_draft, {})
vim.api.nvim_create_user_command('DraftMerge', drafts.merge_draft, {})
vim.api.nvim_create_user_command('DraftAbandon', drafts.abandon_draft, {})

vim.api.nvim_create_user_command('ExportPDF', function(opts)
    export:export_pdf(opts)
end, { nargs = '+' })
vim.api.nvim_create_user_command('ExportDOCX', function(opts)
  export:export_docx(opts)
end, { nargs = '+' })
vim.api.nvim_create_user_command('ExportMD', function(opts)
  export:export_md(opts)
end, { nargs = '+' })
