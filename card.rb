class Card
  attr_reader :description, :word

  def initialize(arrgs = {})
    @description = arrgs[:description]
    @word = arrgs[:word]
    # @count = arrgs[:count]
  end

  def to_s
    "#{description} #{word}"
  end
end

