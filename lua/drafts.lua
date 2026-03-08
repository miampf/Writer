local helpers = require("helpers")

local drafts = {}

function drafts:get_current_branch()
  local branch_fd = assert(io.popen('git branch --show-current'))
  branch_fd:flush()
  local branch = branch_fd:read('*all')
  branch_fd:close()

  return branch
end

-- This function creates a new "draft",
-- aka a git branch with random naming.
function drafts:new_draft()
  local branch_suffix = helpers:string_random(32)
  os.execute(string.format("git switch -c draft-%s", branch_suffix))
end

-- This function merges a draft.
function drafts:merge_draft()
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

function drafts:abandon_draft()
  local branch = get_current_branch()
  os.execute("git switch main")
  os.execute(string.format("git branch -D %s", branch))
end

return drafts
