class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :subtitle, presence: true,
                    length: { minimum: 5 }

  mount_uploader :photo, PhotoUploader

  def short_title
    self.title.truncate(30)
  end

  def short_subtitle
    self.subtitle.truncate(75)
  end

  def short_text
    self.text.truncate(200)
  end
end
