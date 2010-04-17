namespace :emailing do
  
  desc "Sends Leads List to provider"
  task :send_leads_list do
    BackgroundTask.sends_leads_list_to_providers
  end
  
end