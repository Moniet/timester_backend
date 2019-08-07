class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true

    has_many :tasks
    has_many :goals
    has_many :goals, through: :tasks
end
