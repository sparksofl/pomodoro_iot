class PomodorosController < ApplicationController
  skip_before_action :authenticate_user_from_token!
  before_action :set_pomodoro, only: [:show, :update, :destroy]
  before_action :find_user, only: :create

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
    @pomodoro.update_attribute(:task_id, @current_user.tasks.where(current: true)[0].id)

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
      params.permit(:duration)
    end

    def find_user
      @current_user = User.find(Timer.find_by(token: params[:token]).user_id)
    end
end
