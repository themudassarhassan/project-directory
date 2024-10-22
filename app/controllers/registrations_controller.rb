class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]

  def new
  end

  def create
    user = User.new(registration_params)

    if user.save
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_registration_url, alert: user.errors.full_messages.join(',')
    end
  end


  private

    def registration_params
      params.permit(:name, :email, :password)
    end
end
