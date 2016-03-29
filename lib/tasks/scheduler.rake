namespace :scheduler do

  desc "This task will hit USGS API and update database"
  task :update_cfs => :environment do
    CFSTask.update_cfs
  end
end