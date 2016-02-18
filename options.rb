#!/usr/bin/env ruby
#very likely doesn't work or needs some work. 
require 'trollop'
p = Trollop::options do
  version "runby 0.0.1 by https://github.com/asvnpr"
  banner <<-EOS
runby lets you message someone (preferably yourself) when a process has finished running.
This program needs you to input a phone number and a command to run. Only works in POSIX systems.

Usage:
       runby.rb -n <phone number in yaml file> -c <your command>
       runby.rb -n <phone number in yaml file> -c <your command> -f to run a command as root. Only do this if you absolutely know what you are doing!!!
where [options] are:
EOS

  opt :number, "Phone number from contacts file to message", :type => :string # string --number <s>, default nil
  opt :command, "Command to run", :type => :string, :default => "telnet towel.blinkenlights.nl" # string --command <s>, default telnet towel.blinkenlights.nl
  opt :force_root, "Force program to allow you to run as root.", :default => false # flag --force, default false
  opt :help, "Display help message."
end

opts = Trollop::with_standard_exception_handling p do
  raise Trollop::HelpNeeded if ARGV.empty? # show help screen
  p.parse ARGV
end
