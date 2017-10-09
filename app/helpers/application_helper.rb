module ApplicationHelper
	def sport_name(sport_id)
		Sport.find(sport_id).title
	end
	def present(model, presenter_class=nil)
		klass = presenter_class || "#{model.class}Presenter".constantize
		presenter = klass.new(model, self)
		yield(presenter) if block_given?
	end
end
