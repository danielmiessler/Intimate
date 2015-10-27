require 'json' 
require 'open-uri' 
require 'csv' 

# Get the JSON object 
url = URI.parse("http://tmi.twitch.tv/group/user/tsm_dyrus/chatters") 
json = open(url).read 

# Put the content into a hash table 
users = JSON.parse(json) 

# Write the chatters -> viewers to CSV 
CSV.open("intimateusers.csv", "w") do |csv| 
  csv << users["chatters"]["viewers"] 
end
