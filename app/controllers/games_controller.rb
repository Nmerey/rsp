class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
  end

  def create
    user_throw = params[:throw]
    server_throw = FetchCurbThrowService.call

    server_throw = WinningCombinations::THROW_SIGNS.sample if server_throw.nil?

    @result = RpsResultService.new(user_throw, server_throw).call

    render json: { result: @result, server_throw: server_throw }
  end
end
