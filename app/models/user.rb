class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :votes
  has_many :comments
  has_many :voted_posts, :through => :votes, :source => :voteable, :source_type => 'Post'
  has_many :voted_comments, :through => :votes, :source => :voteable, :source_type => 'Comment'
end
