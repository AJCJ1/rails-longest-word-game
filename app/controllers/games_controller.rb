require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @url = "https://wagon-dictionary.herokuapp.com/x-ray"
    @word_serialized = URI.open(@url).read
    @checker_word = JSON.parse(@word_serialized)
    @score = @checker_word["length"]
    @letters = params[:letters]

    @letters.split(" ").each do |letter|
      if @word.include?(letter)
        @result = "The word you enter can't be built from the grid!"
      else
        @result = "You passed the test"
      end
    end
  end
end
# word cant be built out of original grid
# word is calid according to grid, but is not english word
# word is valid acc to grid and is an english word
