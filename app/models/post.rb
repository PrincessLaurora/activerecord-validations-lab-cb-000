class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
end


  class MyValidator < ActiveModel::Validator
      def validate(post)
        unless post.title.include? "Won't Believe || Secret || Top [number] || Guess"
          post.errors[:title] << "It's not clickbait-y!"
      end
    end
  end

class Post
  include ActiveModel::Validations
  validates_with MyValidator
end  
