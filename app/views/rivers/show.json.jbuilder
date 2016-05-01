json.extract! @river, :id, :name, :section, :difficulty, :cfs, :details, :state, :put_in, :take_out, :min_cfs, :max_cfs, :picture
json.alerts(@alerts) do |alert|
  json.extract! alert, :title, :details, :created_at
end
