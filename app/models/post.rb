class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_author_posts_count

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_author_posts_count
    author.increment!(:posts_count)
  end
end
