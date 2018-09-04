class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: {maximum: 10}
  validates :content, length: {minimum: 10}
  validates :category, inclusion: %w(Fiction Non-Fiction)
  validate :is_vaild?

  def is_vaild?
     if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? {|w|  w.match title}
      self.errors.add(:title, "must be clickbait")
    end
  end


end
