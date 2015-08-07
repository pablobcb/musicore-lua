require './note'
require './interval'
require './listutil'

function createScale (root, intervals)
  local scaleNotes = { root }

  -- resolves each interval into notes
  for _, interval in ipairs(intervals) do
    table.insert(scaleNotes, resolveInterval(
      root, 'ascending', interval ))
  end

  return scaleNotes
end

function createMode (mode, root)
  local scale = createScale(root, 
  	{ majorSecond
		, majorThird
		, perfectFourth
		, perfectFifth
		, majorSixth
		, majorSeventh })

  local twoOctaves = table.merge(scale, scale)

  -- sets the first note corresponding to the mode root
  local shiftedScale = table.drop(twoOctaves, mode - 1 )

  -- composes the scale with 7 notes only
  return table.take(shiftedScale, 7)

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
      root, 'ascending', minorThird ))
end

majorScale = ionianScale
