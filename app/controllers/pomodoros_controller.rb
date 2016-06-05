class PomodorosController < ApplicationController
  before_action :set_pomodoro, only: [:show, :update, :destroy]

  # GET /pomodoros
  # GET /pomodoros.json
  def index
    @pomodoros = Pomodoro.all

    render json: @pomodoros
  end

  # GET /pomodoros/1
  # GET /pomodoros/1.json
  def show
    render json: @pomodoro
  end

  # POST /pomodoros
  # POST /pomodoros.json
  def create
    @pomodoro = Pomodoro.new(pomodoro_params)

    if @pomodoro.save
      render json: @pomodoro, status: :created, location: @pomodoro
    else
      render json: @pomodoro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pomodoros/1
  # PATCH/PUT /pomodoros/1.json
  def update
    @pomodoro = Pomodoro.find(params[:id])

    if @pomodoro.update(pomodoro_params)
      head :no_content
    else
      render json: @pomodoro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pomodoros/1
  # DELETE /pomodoros/1.json
  def destroy
    @pomodoro.destroy

    head :no_content
  end

  private

    def set_pomodoro
      @pomodoro = Pomodoro.find(params[:id])
    end

    def pomodoro_params
      params.require(:pomodoro).permit(:duration, :task_id)
    end
end
