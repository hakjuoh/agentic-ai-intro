-- Pandoc Lua filter: reshape the metadata that LaTeX gives us for the blog layout.
--   * split "\title{Main:\\ Sub}" at the line break into title and subtitle
--   * drop the trailing colon of the main title
--   * join author lines ("Name \\ Affiliation") into one line

local function split_at_break(inlines)
  local before, after, seen = {}, {}, false
  for _, el in ipairs(inlines) do
    if el.t == 'LineBreak' then
      seen = true
    elseif seen then
      table.insert(after, el)
    else
      table.insert(before, el)
    end
  end
  return before, after, seen
end

local function trim_end(list)
  while #list > 0 and (list[#list].t == 'Space' or list[#list].t == 'SoftBreak') do
    table.remove(list)
  end
  return list
end

-- Metadata values that hold inline text arrive as an Inlines list.
local function is_inlines(value)
  return value ~= nil and pandoc.utils.type(value) == 'Inlines'
end

function Meta(meta)
  if is_inlines(meta.title) then
    local before, after, seen = split_at_break(meta.title)
    if seen then
      trim_end(before)
      local last = before[#before]
      if last and last.t == 'Str' and last.text:sub(-1) == ':' then
        before[#before] = pandoc.Str(last.text:sub(1, -2))
      end
      meta.title = pandoc.Inlines(before)
      meta.subtitle = pandoc.Inlines(after)
    end
  end

  local function join_lines(inlines)
    local joined = {}
    for _, el in ipairs(inlines) do
      if el.t == 'LineBreak' then
        table.insert(joined, pandoc.Str(','))
        table.insert(joined, pandoc.Space())
      else
        table.insert(joined, el)
      end
    end
    return pandoc.Inlines(joined)
  end

  if is_inlines(meta.author) then
    meta.author = join_lines(meta.author)
  elseif meta.author ~= nil and pandoc.utils.type(meta.author) == 'List' then
    local authors = {}
    for _, entry in ipairs(meta.author) do
      table.insert(authors, is_inlines(entry) and join_lines(entry) or entry)
    end
    meta.author = authors
  end

  return meta
end
