class ApplicationController < ActionController::Base
  before_action :set_locale

  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
