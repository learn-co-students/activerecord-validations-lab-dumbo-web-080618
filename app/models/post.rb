class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "The Category must be either 'Fiction' or 'Non-Fiction'."}
  validate :click_baity

  def click_baity
    #regular expression used to check if the title is click bait-y
  reg = %r([\w\W]*Won't Believe [\w\W]*|[\w\W]*Secret[\w\W]*|[\w\W]*Top [d]*[\w\W]*|[\w\W]*Guess[\w\W]*)
    if title.present? && title.match(reg).nil?
      errors.add(:click_baity, "Title is not click-baity enough")
    end
  end
    
end
