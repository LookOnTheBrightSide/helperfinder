class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]
  before_action :card_owner, only: [:edit, :update, :destroy]
  def index
    @cards = Card.all.order("created_at DESC")
    @card_current_user = Card.where(user_id: current_user)
  end
  def show
    find_card
  end
  def new
    @card  = current_user.cards.build
  end
  def create
    @card  = current_user.cards.build(card_params)
    if @card.save
      redirect_to @card
    else
      render "new"
    end
  end
  def edit
  end
  def update
    if @card.update(card_params)
      redirect_to @card
    else
      render "edit"
    end
  end
  def destroy
    @card.destroy
    redirect_to cards_path
  end
  private

  def card_owner
    unless @card.user_id == current_user.id
      redirect_to cards_path, notice: "You're not authorized to do that" unless current_user.id == @card.user_id
    end
  end
  def find_card
    @card = Card.find(params[:id])
  end
  def card_params
    params.require(:card).permit( :title,:content,:hours,:location,:pay)
  end
end
