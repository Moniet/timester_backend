class GoalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :task_id, :start_time, :end_time
  
  # attribute start_time: :start_time.time
  # 
  # byebug:
end
