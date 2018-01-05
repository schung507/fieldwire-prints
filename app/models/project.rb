class Project < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    has_many :floorplans, :class_name => "Floorplan"
end