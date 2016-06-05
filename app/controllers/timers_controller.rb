class TimersController < ApplicationController
  before_action :set_timer, only: [:show, :update, :destroy]

  # GET /timers
  # GET /timers.json
  def index
    @timers = Timer.all

    render json: @timers
  end

  # GET /timers/1
  # GET /timers/1.json
  def show
    render json: @timer
  end

  # POST /timers
  # POST /timers.json
  def create
    @timer = Timer.new(timer_params)

    if @timer.save
      render json: @timer, status: :created, location: @timer
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timers/1
  # PATCH/PUT /timers/1.json
  def update
    @timer = Timer.find(params[:id])

    if @timer.update(timer_params)
      head :no_content
    else
      render json: @timer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timers/1
  # DELETE /timers/1.json
  def destroy
    @timer.destroy

    head :no_content
  end

  private

    def set_timer
      @timer = Timer.find(params[:id])
    end

    def timer_params
      params.require(:timer).permit(:user_id, :token)
    end
end
