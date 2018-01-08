class Version < ActiveRecord::Base
	belongs_to :floorplan
	mount_uploader :blueprint, FloorplanUploader
	serialize :blueprint, JSON
	serialize :versions, JSON
end
