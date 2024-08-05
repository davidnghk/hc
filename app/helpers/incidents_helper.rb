module IncidentsHelper
# helpers/incidents_helper.rb
# Returns a dynamic path based on the provided parameters
	def sti_incident_path(type = "incident", incident = nil, action = nil)
	  send "#{format_sti(action, type, incident)}_path", incident
	end

	def format_sti(action, type, incident)
	  action || incident ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end

end