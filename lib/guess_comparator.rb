class GuessComparator
  def compare(user_guess, code)
    i =  0
    str = ''
    while i < 4
      if user_guess[i] == code[i]
       str += '+'
      elsif code.include?(user_guess[i])
        str += '-'
      else
       str += '_'
      end
      i += 1
    end
    str
  end

end
