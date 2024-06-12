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
      @result = RpsResultService.new(user_throw, server_throw).call
    end

    @user_throw = user_throw
    @server_throw = server_throw

    render :index
  end
end
