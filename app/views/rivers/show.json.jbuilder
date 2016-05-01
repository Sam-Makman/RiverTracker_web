json.extract! @river, :id, :name, :section, :difficulty, :cfs, :details, :state, :put_in, :min_cfs, :max_cfs, :take_out, :picture

json.alerts(@alerts) do |alert|
  json.extract! alert, :title, :details, :created_at
end
