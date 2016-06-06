class Api::CardsController < ApplicationController
  def index
    render json: Card.all
  end

  def show
    card = Card.find(params[:id])
    render json: card
  end

  def create
    card = Card.new(list_params)

    if list.save
      head 200
    else
      head 500
    end
  end
end

private

def list_params
  
end
