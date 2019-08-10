class GoalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :start_time, :end_time, :task_id
end
