class MasteryController < ApplicationController
  before_action :auth_mastery, only: [:update]

  def show
    @masteries = Mastery.where(user: logged_in_user).where('next_test <= ?', Time.zone.now)
    render json: { masteries: @masteries }
  end

  def update
    @mastery.calculate(params[:difficulty])
    if @mastery.save
      render json: { mastery: @mastery }
    else
      render json: { errorMessage: 'something went wrong' }, status: 400
    end
  end

  private

  def auth_mastery
    @mastery = Mastery.find(params[:id])
    render json: {}, status: 401 unless @mastery.user == logged_in_user
  end
end
