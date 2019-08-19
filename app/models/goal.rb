class Goal < ApplicationRecord
    validates :title, :start_time, :end_time, presence: true
    belongs_to :task
end
