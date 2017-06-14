module ApplicationHelper

	def errors(object)
		render(:partial=>'application/error_messages',:locals=>{:object=>object})
	end
end
