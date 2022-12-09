class Order < ApplicationRecord
  validates :instructions, presence: true, length: { minimum: 16, maximum: 200 }
  validates :name, presence: true
  validates :location, presence: true, length: { minimum: 4 }
  validates :wastetype, presence: true
  validates :weight, presence: true
  validates :date, presence: true

  belongs_to :user
end
