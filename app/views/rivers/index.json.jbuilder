json.array!(@rivers) do |river|
  json.extract! river, :id, :name, :section, :difficulty, :cfs, :details, :state, :put_in, :take_out, :picture
end
