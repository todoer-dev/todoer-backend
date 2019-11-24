# frozen_string_literal: true

module API
  class TasksController < ApplicationController
    PERMITTED_PARAMS = [
      :title,
      :is_starred,
      :description,
      :due_date,
      :completed_at,
      :created_at,

      labels: []
    ]

    before_action :require_authentication
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /tasks
    def index
      render json: current_user.tasks
    end

    # GET /tasks/1
    def show
      render json: @task
    end

    # POST /tasks
    def create
      task = current_user.tasks.new(task_params)

      if task.save
        render json: task, status: :created
      else
        render json: task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1
    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    def destroy
      @task.destroy
    end

    private

    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(*PERMITTED_PARAMS)
    end
  end
end
