require 'guess_comparator'

class GameRunner
  def initialize(code, io)
    @io = io
    @code = code
  end

  def play_game
    comparor = GuessComparator.new
    guess = @io.prompt_guess()
    i = 1
    while guess != @code && i != 11
      response = comparor.compare(guess, @code)
      @io.give_response(response)
      puts "This is try # #{i+1} "
      puts "Please make another guess. #{guess = @io.prompt_guess()} "
      i += 1
     end
     if guess == @code
       puts "You broke the code! You are a Mastermind!"
    end
  end

end
