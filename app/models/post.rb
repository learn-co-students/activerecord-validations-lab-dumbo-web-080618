class Post < ActiveRecord::Base
  validates :title, presence:true
  validate
  validates :content, length:{minimum:250}
  validates :summary, length:{maximum:250}
  validates :category, inclusion:{ in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
  validate :title_click_bait

  def title_click_bait
    if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? {|pat| pat.match title}
      errors.add(:title, "must be clickbait")
    end
  end
end
