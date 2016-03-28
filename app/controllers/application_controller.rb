##
# Default application controller
#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.env == 'development'
    rescue_from CanCan::AccessDenied do |_exception|
      render file: "#{Rails.root}/public/403.html", status: 403, layout: false
    end

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    end

    rescue_from Exception do |_exception|
      render file: "#{Rails.root}/public/500.html", status: 500, layout: false
    end
  end
end
