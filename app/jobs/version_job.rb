class VersionJob < Struct.new(:floorplan)
    def perform
        version_uploader = FloorplanVersionUploader.new
        connection = Fog::Storage.new({
          provider: 'AWS',
          aws_access_key_id: ENV['S3_ACCESS_KEY'],
          aws_secret_access_key: ENV['S3_SECRET_KEY'],
          region: 'us-west-2'
        })
        bucket = connection.directories.new(key: ENV['S3_BUCKET'])
        file = bucket.files.get(floorplan)
        puts floorplan
        puts file
        version_uploader.store!(file)
        puts version_uploader.retrieve_from_store!(file)
    end
end
    