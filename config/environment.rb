# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Paperclip config:
Paperclip.options[:image_magick_path] = "/opt/ImageMagick/bin"
Paperclip.options[:command_path] = "/opt/ImageMagick/bin"
