class Floorplan < ActiveRecord::Base
    belongs_to :project
    has_many :versions, dependent: :destroy
    accepts_nested_attributes_for :versions
end
