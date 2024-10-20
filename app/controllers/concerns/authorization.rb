module Authorization
  extend ActiveSupport::Concern
  include Pundit::Authorization

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private
    def user_not_authorized
      redirect_to root_url, alert: "You are not authorized to perform this action."
    end
end
