module RescueRecordNotFound
  extend ActiveSupport::Concern
  
  included do
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_and_alert
  end
  
  private
    def redirect_and_alert
      redirect_to root_url, alert: "Record with the given ID does not exist."
    end
end
