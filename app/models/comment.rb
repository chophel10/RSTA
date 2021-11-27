class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :complain
  validates :content, presence: true
end
