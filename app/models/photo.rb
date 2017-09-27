class Photo < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :likes, class_name: 'PhotoLike'

  # def liked_by?(user)
  #   PhotoLike.where(photo: self, user: user).exists?
  #   #likes.where(user: user).count > 0
  # end
  has_and_belongs_to_many :likers, class_name: 'User', join_table: :likes
  
    def liked_by?(user)
      likers.exists?(user.id)
    end
  
    def toggle_liked_by(user)
      # If photo has been liked by 'user'
      if likers.exists?(user.id)
        likers.destroy(user.id)
  
      # If photo has *not* been liked by the 'user'
      else
        likers << user
      end
    end
end
