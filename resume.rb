# A Sinatra app for displaying one's resume in multiple formats

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'
require 'maruku'
require 'pdfkit'

PDFKit.configure do |config|
  config.wkhtmltopdf = 'vendor/bin/wkhtmltopdf-amd64'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
end

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
   title = resume_data.split("\n").first.gsub(/[^0-9a-z ]/i, '')
   #oops 1.8.7 only?
    #resume_data.lines.first.strip
   erubis :index, :locals => { :title => title, :resume => resume_html, :formats => true }
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

get '/latex' do
  content_type 'application/x-latex'
  doc = Maruku.new(resume_data)
  doc.to_latex_document
end

get '/markdown' do
  content_type 'application/markdown'
  resume_data
end

# note this only works if pdflatex is installed which is part of most LaTeX packages, but doesn't work on Heroku
# TODO if this ever works on heroku clean it up and add caching
get '/pdf' do
  pdf_file = './tmp/resume.pdf'

  return File.read(pdf_file) if File.exists?(pdf_file)
  doc = Maruku.new(resume_data)
  kit = PDFKit.new(resume_html)
  kit.to_file(pdf_file)
  File.read(pdf_file)
end

def resume_data
  File.read("data/resume.md")
end

def resume_html
  RDiscount.new(resume_data, :smart).to_html
end

