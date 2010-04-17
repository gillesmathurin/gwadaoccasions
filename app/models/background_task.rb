class BackgroundTask
  
  VehicleLeadsStruct = Struct.new(:vehicle, :leads)
  ProviderLeadsStruct = Struct.new(:provider, :vehicles_leads)
  
  def self.sends_leads_list_to_providers
    @vehicle_leads_array = []
    @provider_leads_array = []
    
    Provider.all.each do |provider|
      provider.vehicles.available.each do |vehicle|
        lead_users = []
        vehicle.matching_searchprofiles.each do |sp|
          lead_users << sp.user
        end
        @vehicle_leads_array << VehicleLeadsStruct.new(vehicle, lead_users)
      end
      @provider_leads_array << ProviderLeadsStruct.new(provider, @vehicle_leads_array)
    end
    
    @provider_leads_array.each do |match_list|
      begin
        BackgroundTaskMailer.deliver_leads_list(match_list)
      rescue Exception => e
        Rails.logger.info("#{e}")
      end
      
    end
  end
  
end
