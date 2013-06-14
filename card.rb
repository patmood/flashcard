class Card
  attr_reader :description, :word, :guess_count, :display_count

  def initialize(arrgs = {})
    @description = arrgs[:description]
    @word = arrgs[:word].strip
    @display_count = 0
    @guess_count = 0
  end

  def to_s
    "#{description} #{word}"
  end

  def increase_display_count
    @display_count += 1
  end

  def increase_guess_count
    @guess_count += 1
  end  

  def reset_guess_count
    @guess_count = 0
  end
end