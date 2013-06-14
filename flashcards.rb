require_relative 'deck'
require_relative 'card'
require 'csv'


class FlashCard
	def initialize
		@flashcards = Deck.new
		@flashcards.load_deck(AGRV)
	end

	def play
		@card = @flashcards.get_card
		print_description
		user_prompt
		exit
	end

	private

	def user_prompt
		@user_input = prompt "Guess: "

		until exit_or_equal
			puts "Incorrect!  Try again.\n\n"
			@user_input = prompt "Guess: "
		end
	end

	def exit_or_equal
		(@user_input == @card.word || @user_input == 'exit')
	end

	def exit
		unless @user_input.chomp == 'exit'
			puts "Correct!\n\n"
			play
		end
	end

	def prompt(*args)
		print(*args)
		gets.chomp
	end

	def print_description
		puts "Definition:\n#{@card.description}\n"
	end
end

flashcard = FlashCard.new
puts "\nWelcome to Ruby Flash Cards.\n\nTo play, just enter the correct term for each definition. Ready?  Go!\n\n"
flashcard.play