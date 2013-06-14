require_relative 'deck'
require_relative 'card'
require 'csv'

class FlashCard
	def initialize
		@flashcards = Deck.new
		@flashcards.load_deck('flashcard_samples.txt')
	end

	def play
		@card = @flashcards.get_card
		print_definition

		user_input = prompt "Guess: "
		user_input.chomp.downcase

		until (@card.word.strip.downcase == user_input.chomp.downcase || 'exit' == user_input.chomp.downcase)
			puts "Incorrect!  Try again.\n"
			user_input = prompt "Guess:"
			puts ""
		end

		unless 'exit' == user_input.chomp
			puts "Correct!\n\n"
			play
		end
	end

	def prompt(*args)
	    print(*args)
	    gets
	end

	def print_definition
		puts "Definition\n\n#{@card.description}\n"
	end
end

flashcard = FlashCard.new
puts "\nWelcome to Ruby Flash Cards.\n\nTo play, just enter the correct term for each definition. Ready?  Go!\n\n"
flashcard.play
