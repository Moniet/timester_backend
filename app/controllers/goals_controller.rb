class GoalsController < ApplicationController
    def create
        goal_params[:goals].each do |goal|
            goal = Goal.new(goal)
            if goal
                goal.save
                render json: { message: 'goal created'}, status: :created
            else
                render json: { error: goal.errors.messages }, status: :not_acceptable
            end
        end
    end

    private 

    def goal_params
        params.require(:data).permit(:goals => [:task_id, :title, :start_time, :end_time])
    end
end
