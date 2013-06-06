source "https://rubygems.org"
ruby "1.9.2"

gem 'rake'
gem 'less'
gem 'erubis'
gem 'sinatra'
gem 'rdiscount'
gem 'maruku'
gem 'thin'
gem 'pdfkit'

configure :production do
    require 'newrelic_rpm'
end

group :development, :test do
  gem "rack-test"
  gem "launchy"
end
