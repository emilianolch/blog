# Interface to Telegram Bot API
require 'httpclient'

class Bot
  API_BASE_URL = "https://api.telegram.org/bot"

  def initialize
    id = File.read(Rails.root.join('telegram-bot'))
    @url = API_BASE_URL + id
  end

  def get_updates
    Thread.new do
      client = HTTPClient.new
      puts client.get_content(@url + '/getUpdates')
    end
  end
end