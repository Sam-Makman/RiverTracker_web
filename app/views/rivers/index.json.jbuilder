json.array!(@rivers) do |river|
  json.extract! river, :id, :name, :section, :difficulty, :cfs, :details, :state, :put_in, :take_out,  :min_cfs, :max_cfs, :picture
  json.has_alert has_alert? river
end
