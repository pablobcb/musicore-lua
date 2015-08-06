local notes = {'C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B'}

function following (note)
  if note == 'B' then
    return 'C'
  end

  for i, _ in ipairs(notes) do
    if notes[i] == note then
      return notes[i+1]
    end

  end

end

function previous (note)
  if note == 'C' then
    return 'B'
  end

  for i, _ in ipairs(notes) do
    if notes[i+1] == note then
      return notes[i]
    end

  end

end

