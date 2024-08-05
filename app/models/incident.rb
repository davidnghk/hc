class Incident < ApplicationRecord
  belongs_to :location
  belongs_to :user
  belongs_to :task

  belongs_to :responsible_user, :class_name => "User", 
    :foreign_key  => "responsible_user_id", optional: true
  belongs_to :worker_user, :class_name => "User",  
    :foreign_key  => "worker_user_id", optional: true

  enum status: { Draft: 0, Assigned: 1, Acknowledged: 2, Rejected: 3, InProgress: 4, 
  	PendForApproval: 5, Completed: 7, cancelled: 6}

  enum source: { Client: 1, Staff: 2 } 

  scope :help_incidents,  -> { where(type: 'HelpIncident') } 
  scope :house_incidents, -> { where(type: 'HouseIncident') } 
  scope :asset_incidents, -> { where(type: 'AssetIncident') } 

  after_initialize :set_default_values, :if => :new_record? 
  before_create :assign_person_in_charge 

  def self.types
      %w(HelpIncident HouseIncident AssetIncident)
  end

  def self.i18n_statuses(hash = {})
    statuses.keys.each { |key| hash[I18n.t("statuses.#{key}")] = key }
    hash
  end

  def self.assign_task(incident_id)
    i = Incident.find(incident_id)
    l = Location.find(i.location_id)
    while Workflow.where('incident_type = ? and location_id = ? ', 
      i.type, l.id).count == 0 
      l = l.parent
      puts l.display_name
    end
    wf = Workflow.where('incident_type = ? and location_id = ? ', 
      i.type, l.id).first
    puts "User", wf.user_id, wf.user.display_name
  end


  def self.i18n_sources(hash = {})
    sources.keys.each { |key| hash[I18n.t("sources.#{key}")] = key }
    hash
  end

  private

  def assign_person_in_charge
    l = Location.find(self.location_id)
    while Workflow.where('incident_type = ? and location_id = ? ', 
      self.type, l.id).count == 0 
      l = l.parent
    end
    wf = Workflow.where('incident_type = ? and location_id = ? ', 
      self.type, l.id).first
    self.responsible_user_id = wf.user_id
  end

  def set_default_values
    self.incident_datetime = Time.now
    self.incident_time = Time.now
    self.request_datetime = Time.now
    self.status = 1
    self.source = 2
  end

end
