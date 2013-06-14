class Deck
    attr_reader :last_card
  def initialize
    @cards = []
    @file_contents = []
  end

  def load_deck(filename)
    File.open(filename, 'r').each {|row| @file_contents << row }

    @file_contents.delete_if{|row| row == "\n"}

    (@file_contents.length/2).times do
      input_array = @file_contents.slice!(0,2)
      @cards << Card.new({description: input_array[0], word: input_array[1]})
    end

    @last_card = get_rand_card

  end

  def get_rand_card
    @cards[(rand(0..@cards.length))]
  end

  def get_card
    new_card = get_rand_card
    if new_card != last_card
      last_card = new_card
      new_card
    else
      get_card
    end
  end
end
