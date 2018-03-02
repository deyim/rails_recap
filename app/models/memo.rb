class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments

  # TODO: validation
end
