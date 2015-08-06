require 'note'

minorSecond = 1
majorSecond = 2
minorThird  = 3
majorThird = 4
diminishedFourth = majorThird
perfectFourth = 5
augmentedFourth = 6
diminishedFifth = augmentedFourth
perfectFifth = 7
augmentedFifth = 8
minorSixth = augmentedFifth
majorSixth = 9
minorSeventh = 10
majorSeventh = 11
octave = 12
minorNinth = minorSecond
majorNinth = majorSecond
diminishedEleventh = diminishedFourth
perfectEleventh = perfectFourth
augmentedEleventh = augmentedFourth
minorThirteenth = minorSixth
majorThirteenth = majorSixth

function resolveInterval (note, direction, interval)
  assert(direction == 'ascending'
      or direction == 'descending')

  if interval == 0 then
    return note
  end

  local nextNote
  if direction == 'ascending' then
    nextNote = following(note)
  elseif direction == 'descending' then
    nextNote = previous(note)
  end

  return resolveInterval(nextNote, direction, interval -1)

end
