class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Ficton)}
  validate :is_valid?


  def is_valid?
    if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? {|w|  w.match title}
     self.errors.add(:title, "must be clickbait")
   end
 end

end
