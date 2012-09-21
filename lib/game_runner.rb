require 'guess_comparator'

class GameRunner
  def initialize(code, io)
    @io = io
    @code = code
  end

  def play_game
    comparor = GuessComparator.new
    guess = @io.prompt_guess()
    while guess != @code
      response = comparor.compare(guess, @code)
      @io.give_response(response)
      guess = @io.prompt_guess()
    end
  end

end
