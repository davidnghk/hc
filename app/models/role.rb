class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles

has_many  :manage_role, 
            :class_name => "Workflow",
            :foreign_key  => "manage_role_id"

belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify
end
