class Room < ApplicationRecord
	has_many :user_rooms
	has_many :user, through: :user_rooms
end
