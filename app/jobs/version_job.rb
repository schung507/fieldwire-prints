require 'aws-sdk'

class VersionJob < Struct.new(:floorplan, :model_id)
  DummyModel = Struct.new(:id)

  def perform
      m = DummyModel.new(model_id)
      version_uploader = FloorplanVersionUploader.new(m, nil)
      s3 = Aws::S3::Client.new(
        access_key_id: ENV['S3_ACCESS_KEY'],
        secret_access_key: ENV['S3_SECRET_KEY'],
        region: 'us-west-2'
      )

      file = s3.get_object(bucket: ENV['S3_BUCKET'], key: floorplan)
      body = file.body

      # Define original_filename method on it
      f = floorplan
      body.class.send(:define_method, :original_filename) { f }

      version_uploader.store!(body)
  end
end

#StringIO Work-Around: https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-Upload-from-a-string-in-Rails-3-or-later
#Dummy Model Work-Around: https://stackoverflow.com/questions/21905837/passing-attributes-to-carrierwave-uploader-without-orm