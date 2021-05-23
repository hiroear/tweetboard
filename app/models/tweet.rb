class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :tweet, presence: true, length:{maximum: 140}
end
