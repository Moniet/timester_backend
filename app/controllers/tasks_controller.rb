class TasksController < ApplicationController
    def create
        task = current_user.tasks.build(task_params[:task])
        goals = task_params[:goals]
        goals.each do |goal|  
            task.goals.build(goal)
        end

        task.save

        tasks = TaskSerializer.new(current_user.tasks).serializable_hash
        userGoals = GoalSerializer.new(current_user.goals).serializable_hash
        render json: { tasks: tasks, goals: userGoals }
    end

    def update
        task = Task.find(params[:id])
        task.update_attributes(update_params[:task])

        update_params[:goals].each do |goal|
            prev_goal = Goal.find(goal[:id])
            prev_goal.update_attributes(title: goal[:title], start_time: goal[:start_time], end_time: goal[:end_time])
        end

        tasks = TaskSerializer.new(current_user.tasks).serializable_hash
        goals = GoalSerializer.new(current_user .goals).serializable_hash

        if task
            render json: { tasks: tasks, goals: goals }
        else
            render json: { error: 'couldnt update value'}
        end
    end

    private 

    def task_params
        params.require(:user).permit(:task => [:title, :date, :start_time, :end_time, :recurring], :goals => [:title, :start_time, :end_time])
    end

    def update_params
        params.require(:user).permit(:task => [:title, :date, :start_time, :end_time, :recurring], :goals => [:id, :title, :start_time, :end_time, :task_id])
    end
end