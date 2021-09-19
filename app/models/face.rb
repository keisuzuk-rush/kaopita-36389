class Face < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :text
    validates :department
    validates :skill
  end
end
