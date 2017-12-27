class Project < ActiveRecord::Base
    belongs_to :user
    validates :user_id, presence: true
    mount_uploaders :floorplans, FloorplanUploader
    serialize :floorplans, JSON # If you use SQLite, add this line.
end
