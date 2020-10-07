class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resouce, params)
    resouce.update_without_current_password(params)
  end
