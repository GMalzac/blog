class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :subtitle, presence: true,
                    length: { minimum: 5 }
end
