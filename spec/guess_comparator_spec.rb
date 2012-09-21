require 'guess_comparator'

describe GuessComparator do
  let(:comparor) { GuessComparator.new }

  it 'compares a guess that has no correct guesses' do
    comparor.compare('xxxx', 'aaaa').should == '____'
  end

  it 'compares a guess that has the first position correct' do
    comparor.compare('abbb', 'afff').should == '+___'
  end

  it 'compares a guess that has the first and second positions correct' do
    comparor.compare('abbb', 'abff').should == '++--'
  end

  it 'compares a guess that has the first three positions correct' do
    comparor.compare('abbd', 'abbf').should == '+++_'
  end

  it 'compares a guess that has all four positions correct' do
    comparor.compare('acdc', 'acdc').should == '++++'
  end

  it 'gets one correct guess with an incorrect position' do
    comparor.compare('bbba', 'accc').should == '___-'
  end

  it 'gets two correct guess with an incorrect position' do
    comparor.compare('caff', 'accc').should == '--__'
  end

  it 'gets all the wrong guesses' do
    comparor.compare('dcab', 'cabdc').should == '----'
  end
end
