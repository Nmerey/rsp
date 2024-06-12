class GamesController < ApplicationController
  require 'json'

  def index
  end

  def create
    user_throw = params[:throw]
    server_throw = FetchCurbThrowService.call

    if server_throw.nil?
      @result = ['rock', 'paper','scissors'].sample
    else
      @result = RpsResultService.call(user_throw, server_throw)
    end

    @user_throw = user_throw
    @server_throw = server_throw

    render :index
  end

  private

  def get_server_throw
    uri = URI('https://codechallenge.boohma.com/random-throw')
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['type'] # returns 'rock', 'paper', or 'scissors'
  rescue StandardError
    nil
  end

  def determine_result(user_throw, server_throw)
    return "It's a tie!" if user_throw == server_throw

    if (user_throw == 'rock' && server_throw == 'scissors') ||
       (user_throw == 'scissors' && server_throw == 'paper') ||
       (user_throw == 'paper' && server_throw == 'rock')
      "You win!"
    else
      "You lose!"
    end
  end
end
