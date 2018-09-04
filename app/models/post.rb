class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_clickbait

  def title_clickbait
    if ([/Won't Believe/i, /Secret/i, /Top [0-9]/, /Guess/i]).none?{ |a| a.match(title)}
      errors.add(:title, "wrong clickbait")
    end
  end

end
