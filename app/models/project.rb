class Project < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    has_many :floorplans, dependent: :destroy
    accepts_nested_attributes_for :floorplans
end