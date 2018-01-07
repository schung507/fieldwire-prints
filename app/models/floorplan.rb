class Floorplan < ActiveRecord::Base
    belongs_to :project
    mount_uploader :blueprint, FloorplanUploader
    serialize :blueprint, JSON # If you use SQLite, add this line.
    serialize :versions, JSON
end
