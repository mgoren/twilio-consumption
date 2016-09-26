class Message < ApplicationRecord
  before_create :send_sms

  def initialize(attributes)
    @to = attributes[:to]
    @body = attributes[:body]
  end

private

  def send_sms(to, body)
    response = RestClient::Request.new(
      :method => :post,
      :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to,
                    :From => ENV['FROM_PHONE_NUMBER'] }
    ).execute
  end

end
