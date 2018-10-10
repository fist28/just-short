class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    render file: "#{Rails.root}/public/404", status: :not_found
  end
end
