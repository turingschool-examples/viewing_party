class PartiesController < ApplicationController
  def new
    # @title = params[:movie]
    @movie = { title: 'Lord of the Rings', duration: 190 }
    @party = Party.new
  end
end
