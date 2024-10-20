class ApplicationController < ActionController::Base
  include Authentication, Authorization, RescueRecordNotFound
end
