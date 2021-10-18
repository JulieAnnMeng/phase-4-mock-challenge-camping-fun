class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time
  has_one :Campers
  has_one :Activities
end
