class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :taks
  has_many :goals
end
