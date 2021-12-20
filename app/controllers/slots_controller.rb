class SlotsController < ApplicationController
  before_action :auth_slot
  def update
    @slot.quiztype = params[:quiztype] if params[:quiztype]
    @slot.interval = params[:interval].to_i if params.key?(:interval)

    if @slot.save
      render json: @slot, status: 200
    else
      render json: {}, status: 400
    end
  end

  private

  def auth_slot
    @slot = Slot.find(params[:id])
    render json: {}, status: 401 unless @slot.user == logged_in_user
  end
end
