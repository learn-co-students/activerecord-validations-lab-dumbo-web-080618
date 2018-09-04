class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait



  def non_clickbait
    clickbait = ["Won't Believe","Secret","Top [number]", "Guess"]

    if self.title
    unless clickbait.any? do |bait|
        self.title.include?(bait)
      end
      errors.add(:title, "Not in the list")
    end
    end
  end




end
