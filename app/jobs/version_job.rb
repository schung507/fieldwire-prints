require 'aws-sdk'

class VersionJob < Struct.new(:floorplan, :model_id)
  def perform
      m = Version.find(model_id)
      version_uploader = FloorplanVersionUploader.new(m, :versions)  
      # s3 = Aws::S3::Client.new(
      #   access_key_id: ENV['S3_ACCESS_KEY'],
      #   secret_access_key: ENV['S3_SECRET_KEY'],
      #   region: 'us-west-2'
      # )

      # file = s3.get_object(bucket: ENV['S3_BUCKET'], key: floorplan)
      root = Rails.root.to_s #make sure string   
      file = File.open("#{floorplan}")
      #body = file.body
  
      # Define original_filename method on it
      # f = floorplan
      # body.class.send(:define_method, :original_filename) { f }
      version_uploader.store!(file)
      m.update(:versions => version_uploader)
  end
end

#StringIO Work-Around: https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-Upload-from-a-string-in-Rails-3-or-later
#Dummy Model Work-Around: https://stackoverflow.com/questions/21905837/passing-attributes-to-carrierwave-uploader-without-orm