module WinningCombinations
  def self.for(throw)
    combinations = {
      'rock' => ['scissors', 'hammer'],
      'scissors' => ['paper'],
      'paper' => ['rock', 'hammer'],
      'hammer' => ['scissors', 'paper']
    }
    combinations[throw] || []
  end
end
