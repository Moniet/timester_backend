class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token(user_id: @user.id)
        render json: {jwt: token}, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end    
    end

    def tasks
        userData = UserSerializer.new(current_user).serializable_hash
        userTasks = TaskSerializer.new(current_user.tasks).serializable_hash
        userGoals = GoalSerializer.new(current_user.goals).serializable_hash
        render json: { user: userData, tasks: userTasks, goals: userGoals }
    end
   
    private

    def user_params
      params.require(:user).permit(:name, :username, :password)
    end
  end