namespace :emailing do
  
  desc "Sends Leads List to provider"
  task :send_leads_list => :environment do
    BackgroundTask.sends_leads_list_to_providers
  end
  
  desc  "Sends vehicles selection to users"
  task :send_vehicles_selection => :environment do
    BackgroundTask.sends_interesting_vehicles_to_users
  end
end