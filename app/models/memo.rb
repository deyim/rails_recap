class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments

  # TODO: validation
  validates :content, presence: true, length: {miimum:2, maximum:200}
  validates :title, presence: true, length: {miimum:2, maximum:1000}
  validates :user_id, presence: true
end
