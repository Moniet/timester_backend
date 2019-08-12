require 'faker'
require 'time

# user = User.first

# # 10.times do |n|
# #     start_time = n.days.from_now + n.hours
# #     end_time = n.days.from_now + n.hours + 2.hours
# #     task = Task.create(title: Faker::Name.name, date: Time.now, start_time: start_time, end_time: end_time, recurring: false)
# #     user.tasks << task
# # end

# # tasks = Task.all 

# tasks.each do |task|
#     start_time = task.start_time 
#     end_time = task.start_time + 1.hours

#     goal = Goal.create(title: Faker::Name.name, start_time: start_time, end_time: end_time)
#     task.goals << goal
# end