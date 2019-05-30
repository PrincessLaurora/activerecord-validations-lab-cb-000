class Post < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with MyValidator

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


  class MyValidator < ActiveModel::Validator
      def validate(post)
        unless post.title.include? "Won't Believe || Secret || Top [number] || Guess"
          post.errors[:title] << "It's not clickbait-y!"
      end
    end
  end

end