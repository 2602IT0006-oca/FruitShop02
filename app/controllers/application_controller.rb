# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_recent_product

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :admin_flg]
    )
  end

  private

  def store_recent_product
    if params[:controller] == 'products' &&
       params[:action] == 'show'

      product_id = params[:id].to_i

      session[:recent_product_ids] ||= []
      session[:recent_product_ids].delete(product_id)
      session[:recent_product_ids].unshift(product_id)
      session[:recent_product_ids] =
        session[:recent_product_ids].take(5)
    end

    puts session[:recent_product_ids].inspect
  end
end