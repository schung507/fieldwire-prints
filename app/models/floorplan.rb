class Floorplan < ActiveRecord::Base
    belongs_to :project
    mount_uploaders :blueprint, FloorplanUploader
    serialize :blueprints, JSON # If you use SQLite, add this line.
    has_many :versions
end
