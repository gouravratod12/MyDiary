class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception

end
