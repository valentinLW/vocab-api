class CardsController < ApplicationController
  before_action :auth_card, only: [:update, :destroy]
  before_action :auth_box, only: [:new, :new_batch]

  def update
    if params[:correct]
      @card.level += 1 unless @card.level == 5
    else
      @card.level = 1
    end

    interval = Slot.find_by(box: @card.box, order: @card.level).interval
    @card.next_test = Time.zone.now + interval.minute

    if @card.save
      render json: @card, status: 200
    else
      render json: {}, status: 400
    end
  end

  def new
    @card = Card.new(
      language_code: @box.language,
      box: @box,
      from: params[:from],
      to: params[:to],
      color: rand(1..5),
      level: 1
    )

    if @card.save
      render json: @card, status: 200
    else
      render json: { errors: @card.errors.full_messages }, status: 400
    end
  end

  def new_batch
    cards = []
    bad = []
    csv = params[:csv]
    pairs = csv.split("\n")
    pairs.each do |p|
      words = p.split(';')
      if words.size < 2
        bad << p
      else
        card = Card.new(
          language_code: @box.language,
          box: @box,
          from: words[0],
          to: words[1],
          color: rand(1..5),
          level: 1
        )
        cards << card
      end
    end
    @success = true
    cards.each { |c| @success = false unless c.save }
    render json: { cards: cards, bad: bad }, status: @success ? 200 : 400
  end

  def destroy
    if @card.delete
      render json: {}, status: 200
    else
      render json: {}, status: 400
    end
  end

  private

  def auth_card
    @card = Card.find(params[:id])
    render json: {}, status: 401 unless @card.user == logged_in_user
  end

  def auth_box
    @box = Box.find(params[:box_id])
    render json: {}, status: 401 unless @box.user == logged_in_user
  end
end
