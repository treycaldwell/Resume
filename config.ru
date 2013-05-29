 
## Just run the application
require 'resume'
require 'pdfkit'
run Sinatra::Application
PDFKit.configure do |config|
  config.wkhtmltopdf = 'vendor/bin/wkhtmltopdf-amd64'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
end
