class Issue < ApplicationRecord
	has_ancestry

	scope :other_issues, -> { where(type: 'OtherIssue') } 
	scope :sw_issues, -> { where(type: 'SwIssue') }

	def self.types
      %w(SwIssue OtherIssue)
    end

  def self.display_name
    if (I18n.locale == :zh) then 
        "#{chi_name}"
    else 
        "#{name}"
    end 
  end

end
