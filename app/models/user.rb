class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  after_create :assign_default_role

  has_person_name

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :workflows
  has_one_attached :avatar 

  has_many  :incidents
  has_many  :worker_user, 
            :class_name => "Incident",
            :foreign_key  => "work_user_id"

  has_many  :responsible_user,
            :class_name => "Incident",
            :foreign_key  => "responsible_user_id"

  def to_label
    "#{first_name} #{last_name}"
  end 

  def display_name 
    "#{first_name} #{last_name}"
  end 

  def self.user_name(user_id) 
    User.find(user_id).name
  end

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
             name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

end
