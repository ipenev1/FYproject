module ApplicationHelper

	#return a helper on a per-page basis.
	def title
		base_title = "FYproject"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end