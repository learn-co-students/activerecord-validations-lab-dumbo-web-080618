class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category"}
  validate :clickbaity?


    CLICKBAIT_WORDS = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
    # for i in 1..10 do
    #   clickbait_words << "Top #{i}"
    # end

      # /needle/.match('haystack') => nil

    def clickbaity?

      if CLICKBAIT_WORDS.none? { |word| word.match title }
        errors.add(:title, "must be clickbait")
      end
    end



end
