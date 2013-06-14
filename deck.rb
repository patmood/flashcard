class Deck
  def initialize
    @cards = []
    @file_contents = []
  end

  def load_deck(filename)
    File.open(filename, 'r').each {|row| @file_contents << row }

    @file_contents.delete_if{|row| row == "\n"}
    
    iterations = @file_contents.length/2

    iterations.times do
      input_array = @file_contents.slice!(0,2)
      @cards << Card.new({description: input_array[0], word: input_array[1]})
    end

  end

  def get_card
    @cards[(rand(0..@cards.length))]
  end
end
