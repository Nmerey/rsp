class RpsResultService
  attr_reader :server_throw, :user_throw

  def initialize(server_throw, user_throw)
    @server_throw = server_throw
    @user_throw = user_throw
  end

  def call
    return message_for(:draw) if server_throw == user_throw

    result = WinningCombinations.for(server_throw).include?(user_throw)? :win : :lose

    message_for(result)
  end

  private

  def message_for(result)
    case result
    when :win then 'You win!'
    when :lose then 'You lose!'
    when :draw then 'It\'s a draw!'
    end
  end
end
