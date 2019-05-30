class Post < ActiveRecord::Base
    validates :title, presence: true
     validates :content, length: { minimum: 250 }
     validates :bio, length: { maximum: 250 }
end
