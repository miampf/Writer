local export = {}

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

  os.execute(string.format("pandoc --pdf-engine=xelatex -V fontfamily=garamondlibre -s -o export.%s %s", format, files))
end

function export:export_pdf(opts)
  pandoc_export(opts, "pdf")
end

function export:export_docx(opts)
  pandoc_export(opts, "docx")
end

function export:export_md(opts)
  pandoc_export(opts, "md")
end

return export
