# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name
                                                         role registration_number birth_date])
    # quando cria o convite
    devise_parameter_sanitizer.permit(:invite, keys: %i[first_name last_name
                                                        role registration_number birth_date])

    # quando aceita o convite
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name
                                                                role registration_number birth_date])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
