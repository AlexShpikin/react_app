#прочитать что такое protect_from_forgery with: :exception

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def sports_list
  	Sport.all.map{ |c| [c.title, c.id] }
  	# Переписать без map, прочитать map, reduce, each
  end
end
