every 1.day, :at => '4:00 am' do
  rake "emailing:send_leads_list"
end

every 1.day, :at => '5:00 am' do
  rake "emailing:send_vehicles_selection"
end

# test rake task
every 2.minutes do
  rake "emailing:send_leads_list", :environment => :development
end

every 1.minutes do
  rake "emailing:send_vehicles_selection", :environment => :development
end


# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
