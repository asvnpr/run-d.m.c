#!/usr/bin/env ruby
# ruby script that asks the user for a phone number from a contacts list, and 
# the program he/she wants to run. The script then polls every minute to check 
# if the process has finished. Once the process has finished the user will 
# receive a text message informing him the process is done

require 'yaml'
require 'mkmf'
require_relative 'options.rb'
require 'trollop' #maybe unnecessary. idk if ruby is like C++ and it's inherited
require 'net/http'
require 'json'
require 'uri'

contacts = YAML.load_file('contacts.yaml') #load yaml file. should use absolute path to place file in different directory maybe?

def text_when_done(num, cmd, cntcs) #third argument may be unecessary. not familiar with ruby scope

	contacts = cntcs #probably...maybe uneccesary?
	sent = false

	run = `#{cmd}` #really dangerous! I need to find a better way!

	while(!sent)
		sleep 60
		if (`ps cax | pgrep -i #{cmd}`.nil?)
			ip = `dig +short myip.opendns.com @resolver1.opendns.com`.strip()
			host = `hostname`.strip()
			date = `date +"%d-%m-%Y %H:%M %Z"`.strip()
			user = `echo $USER`.strip()
			phone_index = contacts['phone_numbers'].values.index(num)
			phone = contacts['phone_numbers'].values[contacts[phone_index]
			receiver = contacts['phone_numbers'].key(phone) 
			message = "Hey #{receiver}, the process #{cmd} has finished running on #{host} at #{date}.\nThis process was run by #{user} from IP address #{ip}."

			#commence sending message
			send_req = `curl -X POST http://textbelt.com/text -d number=#{num} -d "message=#{message}`
    	body = JSON.parse(send_req.body)
    	body['success'.freeze]
		end
	end
end

def does_not_validate(num, cmd)
	validates = false
	test = find_executable cmd
	test2 = `find . -maxdepth 1 -perm -111 -type f | grep #{cmd}`

	#test if phone number is correct format, present in yaml, etc
	if (num.to_s.length != 10 || contacts['phone_numbers'].values.include? num) 
		validates = true
		puts "You entered an invalid phone number: ", num
	elsif (test.nil? || test.empty? || test2.nil? || test2.empty?) #test if program name is valid
		validates = true
		puts "You entered an invalid command: ", cmd
	validates
	end
end



sec_check = `echo $USER`.split() #get name of current user

if (sec_check == 'root' and p[:force_root] == false)
	puts "It is extremely dangerous to run this program as root!!"
	puts "If you know what you're doing you can force the program to run. See the help section."

else
	puts text_when_done(p[:number], p[:command], contacts) unless does_not_validate(p[:number], p[:command]) #not super sure if this is correct
end


