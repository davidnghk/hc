module IssuesHelper
# helpers/issues_helper.rb
# Returns a dynamic path based on the provided parameters
	def sti_issue_path(type = "issue", issue = nil, action = nil)
	  send "#{format_sti(action, type, issue)}_path", issue
	end

	def format_sti(action, type, issue)
	  action || issue ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end

end
