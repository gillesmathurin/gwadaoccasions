class BackgroundTaskMailer < ActionMailer::Base
  
  def leads_list(match_list)
    setup_leads_mail(match_list)
  end
    
  private
  
  def setup_leads_mail(match_list)
    subject     "Client(s) potentiel(s) du #{Date.today} pour vos véhicules"
    recipients  match_list.provider.email
    from        ""
    sent_on     Time.now
    body        :vehicle_leads_array => match_list.vehicles_leads
  end

end
