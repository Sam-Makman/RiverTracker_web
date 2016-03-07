namespace :river_tasks do
  desc "Gets current streamflow from usgs"
  task update_cfs: :environment do
    rivers = River.all
  end

end
