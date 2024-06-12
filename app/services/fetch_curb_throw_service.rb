class FetchCurbThrowService
  require 'net/http'
  require 'json'

  FETCH_URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'

  def self.call
    uri = URI(FETCH_URL)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    return data['body'] if data['statusCode'] == 200

    nil
  rescue StandardError => e
    e.message
  end
end


def get_server_throw
  uri = URI('https://codechallenge.boohma.com/random-throw')
  response = Net::HTTP.get(uri)
  data = JSON.parse(response)
  data['type'] # returns 'rock', 'paper', or 'scissors'
rescue StandardError
  nil
end
