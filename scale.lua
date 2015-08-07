require './note'
require './interval'
require './listutil'

function createScale (root, intervals)
  local scale = { root }

  for _, interval in ipairs(intervals) do
    table.insert(scale, resolveInterval(root, 'ascending', interval))
  end

  return scale
end

function createMode (mode, root)
  --TODO: fazer um generator
  local scale = createScale(root, 
  		{ majorSecond
		, majorThird
		, perfectFourth
		, perfectFifth
		, majorSixth
		, majorSeventh })

  return table.take(table.drop(table.merge(
      scale, scale),
    mode - 1 ), 
  7)
  
end

function ionianScale (root)
  return createMode(1, root)
end

function dorianScale (root)
  return createMode(2, root)
end

function phrygianScale (root)
  return createMode(3, root)
end

function lydianScale (root) 
  return createMode(4, root)
end

function mixolydianScale (root)
  return createMode(5, root)
end

function aeolianScale (root)
  return createMode(6, root)
end

function locrianScale (root)
  return createMode(7, root)
end

function minorScale (root)
  return aeolianScale(resolveInterval(
      root, 'ascending', minorThird
  ))
end

majorScale = ionianScale
