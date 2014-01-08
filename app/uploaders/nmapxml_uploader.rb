# encoding: utf-8
require 'carrierwave/processing/mime_types'
class NmapxmlUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
   # must use ID for delete to work correctly
   # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.nmapfilename + "." + rand(1...10000).to_s}"
   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(xml)
   end

  
  version :preprocessed do
    #process :preprocess
    process :set_content_type
    def full_filename(for_file)
      super.chomp(File.extname(super)) + '.xml'
    end
    
    def set_content_type(*args)
      self.file.instance_variable_set(:@content_type, "application/xml")
    end
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "scan.xml" if original_filename
  # end

end
