Sinatra + Bootstrap + Twilio
============================

This is a barebones Sinatra project to show how to get started sending SMS messages with Twilio in Ruby. 

Steps:

1) Clone the repo

2) Set your environment variables. See here for more info: http://devcenter.heroku.com/articles/config-vars

API_VERSION = '2010-04-01'

ACCOUNT_SID = ENV['TWILIO_SID']

ACCOUNT_TOKEN = ENV['TWILIO_TOKEN']

CALLER_ID = ENV['TWILIO_CALLER_ID']

PIN = ENV['TWILIO_PIN']
	
3) Start your server. I use the shotgun gem: http://rtomayko.github.com/shotgun/

shotgun config.ru