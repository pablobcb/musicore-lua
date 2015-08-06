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

  scale = table.merge(scale, scale)
  scale = table.drop(scale, mode -1)

  return table.take(scale, 7)
end

function ionianScale (root)
  return createMode(2, root)
end
