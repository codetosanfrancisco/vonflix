class Room < ApplicationRecord
    belongs_to :invitation
    has_many :messages
end
