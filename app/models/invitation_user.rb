class InvitationUser < ApplicationRecord
  belongs_to :friend,class_name:"User"
  belongs_to :invitation
end
