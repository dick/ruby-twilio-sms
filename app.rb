require 'sinatra'
require './lib/twiliolib'

get '/' do
  erb :index
end

post '/sms' do
  @message = params[:sms]
  @phone = params[:phone]
  
  # Twilio REST API version
  API_VERSION = '2010-04-01'

  # Twilio AccountSid and AuthToken
  ACCOUNT_SID = ENV['TWILIO_SID']
  ACCOUNT_TOKEN = ENV['TWILIO_TOKEN']

  # Outgoing Caller ID previously validated with Twilio
  CALLER_ID = ENV['TWILIO_CALLER_ID']
  PIN = ENV['TWILIO_PIN']
  
  account = Twilio::RestAccount.new(ACCOUNT_SID, ACCOUNT_TOKEN)

  d = {
    'From' => CALLER_ID,
    'To' => @phone,
    'Body' => @message
  }

  resp = account.request("/#{API_VERSION}/Accounts/#{ACCOUNT_SID}/SMS/Messages", 'POST', d)
  resp.error! unless resp.kind_of? Net::HTTPSuccess
  puts "code: %s\nbody: %s" % [resp.code, resp.body]
  
  redirect('/')
end