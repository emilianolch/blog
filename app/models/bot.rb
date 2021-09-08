# Interface to Telegram Bot API
require "httpclient"

class Bot
  API_BASE_URL = "https://api.telegram.org/bot"
  CHAT_ID = "-536716532"

  def initialize
    id = File.read(Rails.root.join("telegram-bot"))
    @url = API_BASE_URL + id
    @clnt = HTTPClient.new
  end

  def get_updates
    client = HTTPClient.new

    Thread.new do
      response = client.get_content(@url + "/getUpdates")
      yield(response)
    end
  end

  # Send a text message to the default telegram group
  def send_message(text)
    @clnt.post(@url + "/sendMessage", {
      chat_id: CHAT_ID,
      text: text,
    })
  end
end
