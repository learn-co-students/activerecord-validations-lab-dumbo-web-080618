class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :non_clickbait

  def non_clickbait
    buzz_words = ["Won't Believe", "Secret", "Guess"]
    if self.title && !buzz_words.any? {|buzz_word| self.title.include?(buzz_word)}
        errors.add(:title, "doesn't contain buzz words")
    end
  end
end
