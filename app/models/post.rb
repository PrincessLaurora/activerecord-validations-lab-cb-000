class Post < ActiveRecord::Base


    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


  class MyValidator < ActiveModel::Validator
    include ActiveModel::Validations
    validates_with MyValidator
      def validate(post)
        if post.title.include? "Won't Believe || Secret || Top [number] || Guess"
          post.errors[:title] << "It's not clickbait-y!"
      end
    end
  end

end
