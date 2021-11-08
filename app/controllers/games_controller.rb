require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = english_word?
  end

  def english_word?
    response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}").read
    json = JSON.parse(response)
    json['found']
  end
end
