json.array!(@rivers) do |river|
  json.extract! river, :id, :name, :section, :difficulty, :cfs, :details, :state, :put_in, :min_cfs, :max_cfs, :take_out, :picture
  json.has_alert has_alert? river
end
