require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'scrapper'

final_list = Scrapper.new.perform


# tempHash = {}
File.open("db/emails.json","w") do |f|
  f.write(JSON.pretty_generate(final_list))
end
