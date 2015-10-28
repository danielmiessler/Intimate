require 'json' 
require 'open-uri' 
require 'csv' 

# Get the JSON object 
url = URI.parse("http://tmi.twitch.tv/group/user/lirik/chatters") 
json = open(url).read 

# Put the content into a hash table 
users = JSON.parse(json) 

# Isolate the objects
moderators = users["chatters"]["moderators"]
staff = users["chatters"]["staff"]
admins = users["chatters"]["admins"]
global_mods = users["chatters"]["global_mods"]
total = users["chatter_count"]
viewers = users["chatters"]["viewers"]

# Write the viewers to the CSV file
CSV.open('users.csv', 'w') do |createrow|
    createrow << ["Total"]
    createrow << [total]
    createrow << ["Moderators"]
    createrow << [moderators]
    createrow << ["Admins"]
    createrow << [admins]
    createrow << ["Staff"]
    createrow << [staff]
    createrow << ["Global_mods"]
    createrow << [global_mods]
    createrow << ["Viewers"]
    viewers.each do |viewer|
       createrow << [viewer]
    end
end

#############################################################
# TEST CODE 
#############################################################

# Write the chatters -> viewers to CSV 
#CSV.open("users.csv", "w") do |csv| 
#  csv << users["chatters"]["viewers"] 
#end

#puts users["chatters"]["viewers"][0]
#puts users["chatters"]["viewers"].class

#CSV.open('users.csv', 'w') do |csv|
#    puts users["chatters"]["viewers"].each{|viewer| csv << viewer }
#end
