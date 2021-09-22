class Face < ApplicationRecord
	extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department
  belongs_to :gender
  belongs_to :birthplace
  belongs_to :history

  belongs_to :user
	has_one_attached :image

  with_options presence: true do
    validates :image
    validates :text
    validates :skill
		validates :hobby
		with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
      validates :department_id
      validates :gender_id
      validates :birthplace_id
      validates :history_id
    end
  end
end
