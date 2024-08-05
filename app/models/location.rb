class Location < ApplicationRecord 
  default_scope { order('id DESC') }

  has_many :incidents
  has_ancestry

  enum status: { Active: 1, Archieve: 2}
  
  def display_name
    if (I18n.locale == :zh) then 
        "#{chi_name}"
    else 
        "#{name}"
    end 
  end

  def to_label
    if (I18n.locale == :zh) then 
      "#{chi_name}"
    else 
      "#{name}"
    end 
  end
end
