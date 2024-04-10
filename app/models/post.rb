class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  def self.looks(word)
    if word.present?
      posts = Post.where("title LIKE ?","%#{word}%")
                  .or(Post.where("body LIKE ?","#{word}"))
          
      customers = Customer.where("last_name LIKE?","%#{word}%")
                          .or(Customer.where("first_name LIKE?", "#{word}"))
                          
      customer_post_ids = customers.map { |customer| customer.posts.ids }                    
          
      Post.where(id: [posts.ids + customer_post_ids].uniq)
    else
      Post.all
    end
  end
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
