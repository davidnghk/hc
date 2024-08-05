class Task < ApplicationRecord
	has_many :incidents

	scope :request_tasks, -> { where(type: 'RequestTask') } 
	scope :repair_tasks, -> { where(type: 'RepairTask') } 
  scope :house_tasks, -> { where(type: 'HouseTask') } 
  scope :help_tasks, -> { where(type: 'HelpTask') } 

	def self.types
	  %w(RequestTask RepairTask HelpTask HouseTask)
	end

  def display_name
    if (I18n.locale == :zh) then 
        "#{chi_name}"
    else 
        "#{name}"
    end 
  end

  def to_label
    if (I18n.locale == :zh) then 
      "#{code} #{chi_name}"
    else 
      "#{code} #{name}"
    end 
  end
end
