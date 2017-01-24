class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable, dependent: :destroy 
  accepts_nested_attributes_for  :images, reject_if: :all_blank
  has_many :comments, dependent: :destroy 
  validates :title, :body, presence: true
  has_many :likes, as: :likeable

  self.per_page = 10
  
  acts_as_taggable
  
  
   # self.update(:publish, true) if self.publish_date <= Date.current
   #User.preload(:addresses).where("addresses.country = ?", "Poland")
  
# scope :from_the_past, -> { where("publish_date <= ?", Date.current) }

# OK
# def self.from_the_past
#   where("happens_at <= ?", Time.now)
# end



  
  def newest_comments
    self.comments.order('created_at DESC')
  end
  
  def self.search(search)
   where("title LIKE ?", "%#{search}%") 
  end  

  scope :approve, -> { where(panding: true) } 
  scope :publish, -> { where(publish: true) }
 
  extend FriendlyId
  friendly_id :title,use: [:finders]

 

  def self.most_view_post
    order('countviews desc')
  end   

end
