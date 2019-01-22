require 'bundler'
Bundler.require
require "google_drive"

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'scrapper'

final_list = Scrapper.new.perform


# Add list to email.json
File.open("db/emails.json","w") do |f|
  f.write(JSON.pretty_generate(final_list))
end

session = GoogleDrive::Session.from_config("config.json")
session.files.each do |file|
  p file.title
end
# Uploads a local file.
session.upload_from_file("/path/to/hello.txt", "hello.txt", convert: false)

# Downloads to a local file.
file = session.file_by_title("hello.txt")
file.download_to_file("/path/to/hello.txt")

# Updates content of the remote file.
file.update_from_file("/path/to/hello.txt")
