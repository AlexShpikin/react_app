class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def sports_list
  	Sport.all.map{ |c| [c.title, c.id] }
  end
end
