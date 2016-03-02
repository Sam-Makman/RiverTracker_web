json.array!(@rivers) do |river|
  json.extract! river, :id, :name, :section, :difficulty
end
