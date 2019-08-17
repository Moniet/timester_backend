class TasksController < ApplicationController
    def create
        task = current_user.tasks.build(task_params[:task])
        goals = task_params[:goals]
        goals.each do |goal|  
            task.goals.build(goal)
        end

        task.save 

        tasks = TaskSerializer.new(task).serializable_hash
        userGoals = GoalSerializer.new(task.goals).serializable_hash
        render json: { tasks: tasks, goals: userGoals }
    end

    private 

    def task_params
        params.require(:user).permit(:task => [:title, :date, :start_time, :end_time, :recurring], :goals => [:title, :start_time, :end_time])
    end
end
