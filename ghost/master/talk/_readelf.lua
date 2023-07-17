local function s2u(s)
  local sum = 0
  local list  = {string.byte(s, 1, #s)}
  for i = #list, 1, -1 do
    local v = list[i]
    sum = sum * 256 + v
  end
  return sum
end

local function getName(fh)
  local str = ""
  while true do
    local c = fh:read(1)
    if not(c) or c == "\x00" then
      break
    end
    str = str .. c
  end
  return str
end

local function elfId(s)
  assert(string.sub(s, 1, 4) == "\x7fELF")
  return {
    class = s2u(string.sub(s, 5, 5)),
    data  = s2u(string.sub(s, 6, 6)),
    version = s2u(string.sub(s, 7, 7)),
  }
end

local function elfHeader(fh)
  return {
    ident = elfId(fh:read(16)),
    type  = s2u(fh:read(2)),
    machine = s2u(fh:read(2)),
    word  = s2u(fh:read(4)),
    entry = s2u(fh:read(4)),
    phoff = s2u(fh:read(4)),
    shoff = s2u(fh:read(4)),
    flags = s2u(fh:read(4)),
    ehsize  = s2u(fh:read(2)),
    phentsize = s2u(fh:read(2)),
    phnum = s2u(fh:read(2)),
    shentsize = s2u(fh:read(2)),
    shnum = s2u(fh:read(2)),
    shstrndx  = s2u(fh:read(2)),
  }
end

local function sectionHeader(fh)
  return {
    name  = s2u(fh:read(4)),
    type  = s2u(fh:read(4)),
    flags = s2u(fh:read(4)),
    addr  = s2u(fh:read(4)),
    offset  = s2u(fh:read(4)),
    size  = s2u(fh:read(4)),
    link  = s2u(fh:read(4)),
    info  = s2u(fh:read(4)),
    addralign  = s2u(fh:read(4)),
    entsize  = s2u(fh:read(4)),
  }
end

local function symHeader(fh)
  return {
    name  = s2u(fh:read(4)),
    value = s2u(fh:read(4)),
    size  = s2u(fh:read(4)),
    info  = s2u(fh:read(1)),
    other = s2u(fh:read(1)),
    shndx = s2u(fh:read(2)),
  }
end

local function M(filename)
  local fh  = io.open(filename, "rb")
  local eh = elfHeader(fh)
  if eh.ident.class == 2 then
    error("ELF class")
  end
  local sech
  local symh
  local strtab  = nil
  fh:seek("set", eh.shoff)
  while true do
    sech = sectionHeader(fh)
    if sech.type == 0x02 then
      break
    end
  end
  fh:seek("set", eh.shoff + sech.link * 40)
  local strh  = sectionHeader(fh)
  fh:seek("set", sech.offset)
  while true do
    symh = symHeader(fh)
    if symh.info >> 4 == 1 then
      break
    end
  end
  fh:seek("set", strh.offset + symh.name)
  local name  = getName(fh)
  fh:close()
  return name
end

return M
