class PartiesController < ApplicationController
  def new
    @title = params[:title]
  end
end
