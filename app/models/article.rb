class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :subtitle, presence: true,
                    length: { minimum: 5 }

  def short_title
    if self.title.length > 30
      self.title[0..30] + "..."
    else
      self.title
    end
  end

  def short_subtitle
    if self.subtitle.length > 75
      self.subtitle[0..75] + "..."
    else
      self.subtitle
    end
  end

  def short_text
    if self.text.length > 480
      self.text[0..480] + "..."
    else
      self.text
    end
  end
end
