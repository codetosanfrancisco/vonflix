class Invitation < ApplicationRecord
  belongs_to :user
  has_one :room
  belongs_to :movie
  has_many :invitation_users
  has_many :friends,through: :invitation_users
  
end
