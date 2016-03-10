namespace :river_tasks do
  desc "Gets current streamflow from usgs"
  task update_cfs: :environment do
    CFSTask.update_cfs
  end

end
