require 'game_runner'

describe GameRunner do

  class FakeIO
    attr_reader :guess_count, :responses
    attr_accessor :guesses

    def initialize
      @prompted = false
      @guess_count = 0
      @guesses = []
      @responses = []
    end

    def has_been_prompted?
      @prompted
    end

    def prompt_guess
      @prompted = true
      @guess_count += 1
      @guesses.shift
    end

    def give_response(response)
      @responses << response
    end

  end

  let(:code) {'abcd'}

  it 'propts the user for a guess' do
    io = FakeIO.new
    io.guesses << 'abcd'
    runner = GameRunner.new(code, io)
    runner.play_game
    io.should have_been_prompted
  end

  it "accepts the user's guess and stops asking if the user guesses correctly" do
    io = FakeIO.new
    io.guesses << 'abcd'
    runner = GameRunner.new(code, io)
    runner.play_game
    io.guess_count.should == 1
  end

  it "keeps asking them until the guess correctly" do
    io = FakeIO.new
    io.guesses << 'dbca'
    io.guesses << 'abcd'
    runner = GameRunner.new(code, io)
    runner.play_game
    io.guess_count.should == 2
  end

  it "keeps asking them until the guess correctly" do
    io = FakeIO.new
    io.guesses << 'dbca'
    io.guesses << 'dbca'
    io.guesses << 'abcd'
    runner = GameRunner.new(code, io)
    runner.play_game
    io.guess_count.should == 3
  end

  it "gives the user a response when they guess incorrectly" do
    io = FakeIO.new
    io.guesses << 'dbca'
    io.guesses << 'abcd'
    runner = GameRunner.new(code, io)
    runner.play_game
    io.responses[0].should == '-++-'
  end

end
