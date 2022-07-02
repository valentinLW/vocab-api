class BoxesController < ApplicationController
  before_action :auth_box, only: %i[show delete reset mastery]

  def index
    @boxes = Box.where(user: logged_in_user)
    card_count = Card.where('next_test <= ?', Time.zone.now).where(box: @boxes).group(:box_id).count
    mastery_count = Mastery.where(user: logged_in_user).where('next_test <= ?', Time.zone.now).count
    render json: { boxes: @boxes, counts: card_count, mastery_count: mastery_count }
  end

  def show
    @cards = Card.where(box: @box)
    @slots = Slot.where(box: @box)
    render json: { box: @box, cards: @cards, slots: @slots }
  end

  def new
    @box = Box.new(name: params[:name], language: params[:language], user: logged_in_user)
    if @box.save
      render json: { box: @box }, status: 200
    else
      render json: {}, status: 400
    end
  end

  def delete
    if @box.destroy
      render json: {}, status: 200
    else
      render json: {}, status: 400
    end
  end

  def reset
    @box.cards.each do |card|
      card.level = 1
      card.next_test = Time.zone.now
      card.save
    end
    render json: {}, status: 200
  end

  def mastery
    @box.cards.each do |card|
      Mastery.create!(from: card.from, to: card.to, definition: card.definition, audio: card.audio, repetitions: 0, ease: 2.5, interval: 0, user: card.user, color: card.color)
    end
    @box.destroy
    render json: {}, status: 200
  end

  private

  def auth_box
    @box = Box.find(params[:id])
    render json: {}, status: 401 unless @box.user == logged_in_user
  end
end
