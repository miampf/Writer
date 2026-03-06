math.randomseed(os.time())

local function string_random(length)
    local character_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    local string_sub = string.sub
    local math_random = math.random
    local table_concat = table.concat
    local character_set_amount = #character_set
    local number_one = 1
    local default_length = 10
    local random_string = {}

    for int = number_one, length or default_length do
        local random_number = math_random(number_one, character_set_amount)
        local character = string_sub(character_set, random_number, random_number)

        random_string[#random_string + number_one] = character
    end

    return table_concat(random_string)
end

-- Draft stuff

local function get_current_branch()
  local branch_fd = assert(io.popen('git branch --show-current'))
  branch_fd:flush()
  local branch = branch_fd:read('*all')
  branch_fd:close()

  return branch
end

-- This function creates a new "draft",
-- aka a git branch with random naming.
local function new_draft()
  local branch_suffix = string_random(32)
  os.execute(string.format("git switch -c draft-%s", branch_suffix))
end

-- This function merges a draft.
local function merge_draft()
  -- get the current branch
  local branch = get_current_branch()

  -- final commit
  os.execute("git add .")
  os.execute("git commit -m 'prepare for draft merge'")
  os.execute("git switch main")

  os.execute(string.format("git merge %s", branch))
  os.execute("git reset HEAD^")
  os.execute(string.format("git branch -D %s", branch))

  vim.cmd('DiffviewOpen')
end

local function abandon_draft()
  local branch = get_current_branch()
  os.execute("git switch main")
  os.execute(string.format("git branch -D %s", branch))
end

-- Pandoc export stuff

local function get_files_for_export(dir)
  -- get all markdown files
  return vim.fs.find(function(name, path)
    return name:match('.*%.md$')
  end, { limit = math.huge, type = 'file', path = dir })
end

local function pandoc_export(opts, format)
  local dir = opts.fargs[1]
  print(string.format("Exporting directory %s to export.%s", dir, format))

  local files_table = get_files_for_export(dir)
  local files = table.concat(files_table, " ")

  os.execute(string.format("pandoc -s -o export.%s %s", format, files))
end

local function export_pdf(opts)
  pandoc_export(opts, "pdf")
end

local function export_docx(opts)
  pandoc_export(opts, "docx")
end

local function export_md(opts)
  pandoc_export(opts, "md")
end

vim.api.nvim_create_user_command('DraftNew', new_draft, {})
vim.api.nvim_create_user_command('DraftMerge', merge_draft, {})
vim.api.nvim_create_user_command('DraftAbandon', abandon_draft, {})

vim.api.nvim_create_user_command('ExportPDF', export_pdf, { nargs = '+' })
vim.api.nvim_create_user_command('ExportDOCX', export_docx, { nargs = '+' })
vim.api.nvim_create_user_command('ExportMD', export_md, { nargs = '+' })
