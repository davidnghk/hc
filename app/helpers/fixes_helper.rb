module FixesHelper
# helpers/fixes_helper.rb
# Returns a dynamic path based on the provided parameters
	def sti_fix_path(type = "fix", fix = nil, action = nil)
	  send "#{format_sti(action, type, fix)}_path", fix
	end

	def format_sti(action, type, fix)
	  action || fix ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end

end
