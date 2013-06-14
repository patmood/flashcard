class Deck
    attr_reader :last_card
  def initialize
    @cards = []
    @file_contents = []
    @cards_shown = 0
  end

  def load_deck(filename)
    File.open(filename, 'r').each {|row| @file_contents << row }

    @file_contents.delete_if{|row| row == "\n"}

    (@file_contents.length/2).times do
      input_array = @file_contents.slice!(0,2)
      @cards << Card.new({description: input_array[0], word: input_array[1]})
    end

    @cards = @cards.shuffle

  end

  def get_card
    @cards_shown += 1
    if @cards_shown%2 == 0 || @cards_shown < @cards.length
      puts "lease displays"
      card = least_displays
      card.increase_display_count
      @cards = @cards.shuffle
      card
    else
      puts "Most guesses"
      card = most_guesses
      card.reset_guess_count
      @cards = @cards.shuffle
      card
    end
  end

  def most_guesses
    @cards.max_by { |a| a.guess_count }
  end

  def least_displays
    @cards.min_by { |a| a.display_count }
  end

end
