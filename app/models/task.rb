class Task < ApplicationRecord
    validates :title, :date, :start_time, :end_time, presence: true
    belongs_to :user
    has_many :goals
end
