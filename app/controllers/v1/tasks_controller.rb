module V1
  class TasksController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show, :names]
    before_action :set_task, only: [:show, :update, :destroy]
    before_action :sorted_tasks, only: [:index, :update, :destroy]

    # GET /tasks
    # GET /tasks.json
    def index
      # authenticate_user_from_token!

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

      @task.current! if Task.all.count == 1

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

      @task.current!

      if @task.update(task_params)
        authenticate_user_from_token!

        render json: @tasks, each_serializer: TasksSerializer
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    # DELETE /tasks/1.json
    def destroy
      @task.destroy

      authenticate_user_from_token!
      @tasks = current_user ? current_user.tasks.order(current: :desc) : Task.all.order(current: :desc)

      render json: @tasks, each_serializer: TasksSerializer
    end

    def names
      render json: sorted_tasks.pluck(:name)
    end

    private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:name, :user_id, :estimate, :tags)
      end

      def sorted_tasks
        @tasks = current_user ? User.first.tasks.order(current: :desc) : Task.all.order(current: :desc)
      end
  end
end
