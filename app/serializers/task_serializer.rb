class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :date, :start_time, :end_time, :recurring
end
