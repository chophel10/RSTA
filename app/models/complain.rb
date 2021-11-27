class Complain < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_one :assign, dependent: :destroy

  validates :title, presence: true, length: {in: 6..20}
  validates :content, presence: true
  validates :location, presence: true, length: {in: 5..20}
end
