class RegistrationsController < Devise::RegistrationsController
  before_filter :registrations_accepted
end
