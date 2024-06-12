module WinningCombinations
  THROW_SIGNS = ['rock', 'paper', 'scissors', 'hammer']

  def self.for(throw)
    # Rule for winning combinations can be added new throw signs
    combinations = {
      'rock' => ['scissors', 'hammer'],
      'scissors' => ['paper'],
      'paper' => ['rock', 'hammer'],
      'hammer' => ['scissors', 'paper']
    }
    combinations[throw] || []
  end
end
