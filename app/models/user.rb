class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    validates_presence_of :password, :on => :create

    has_many :tasks
    has_many :goals
    has_many :goals, through: :tasks

    def authenticate(plaintext_password)
        if BCrypt::Password.new(self.password_digest) == plaintext_password
            self
        else
            false
        end
    end
end