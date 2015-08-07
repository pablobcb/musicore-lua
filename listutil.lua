-- applies f to each value of the array
function table.each(t1, f)
  for _, v in ipairs(t1) do
    f(v)
  end
end

-- applies f to each value of the array,
-- return its results
function table.map(t1, f)
  local out = {}

  for i, v in ipairs(t1) do
    out[i] = f(v)
  end

  return out
end

-- applies 'predicate' to each value of the array,
-- returning the ones who satisfies the predicate
function table.filter(t, predicate)
  local out = {}
 
  for _, v in ipairs(t) do
    if predicate(v) then
      out[#out + 1] = v 
    end
  end
 
  return out
end

-- return the FIRST who satisfies the predicate
function table.find(t, predicate)
  for _, v in ipairs(t) do
    if predicate(v) then 
      return v
    end
  end
end

function table.merge(t1, t2)
  local out = {}

  for i,v in ipairs(t1) do
    out[#out + 1] = t1[i]
  end

  for i,v in ipairs(t2) do
    out[#out + 1] = t2[i]
  end

  return out
end

function table.flatten(t1)
  local flat = {}
  for i = 1, #t1 do
    if type(t1[i]) == 'table' then
      local inner_flatten = table.flatten(t1[i])
      flat = table.merge(flat, inner_flatten)
    else
      flat[#flat + 1] = t1[i]
    end
  end
  return flat
end

function table.take(t, n)
  if not t then
   return
  end

  local out = {}

  for i = 1, n do
    if t[i] then
      table.insert(out, t[i])
    end
  end

  return out
end

function table.drop(t, n)
  if n ~= 0 then
    for i = 1, n do
      table.remove(t, 1)
    end
  end 

  return t
end
    
function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match(
     string.gsub(v,"[^'\"]",""), '^"+$' )
    then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v )
      and table.tostring( v ) or tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) 
  and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k )
         .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function table.print (t)
  if not t then
    t = {}
  end

  print(table.tostring(t))
end