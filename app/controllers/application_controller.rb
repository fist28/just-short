class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    render plain: '404 Not found', status: :not_found
  end
end
