module V1
  class TasksController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /tasks
    # GET /tasks.json
    def index
      @tasks = Task.all.order(current: :desc)

      render json: @tasks, each_serializer: TasksSerializer
    end

    # GET /tasks/1
    # GET /tasks/1.json
    def show
      render json: @task, serializer: TaskSerializer
    end

    # POST /tasks
    # POST /tasks.json
    def create
      @task = Task.new(task_params)
      @task.update_attribute(:user_id, current_user.id)

      if @task.save
        render json: @task, serializer: TaskSerializer
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1
    # PATCH/PUT /tasks/1.json
    def update
      @task = Task.find(params[:id])

      Task.where(current: true).each do |t|
        t.update_attribute(:current, false)
      end

      @task.update_attribute(:current, true)

      if @task.update(task_params)
        @tasks = Task.all.order(current: :desc)

        render json: @tasks, each_serializer: TasksSerializer
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    # DELETE /tasks/1.json
    def destroy
      @task.destroy

      @tasks = Task.all.order(current: :desc)

      render json: @tasks, each_serializer: TasksSerializer
    end

    private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:name, :user_id, :estimate, :tags)
      end
  end
end