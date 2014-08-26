class Video < ActiveRecord::Base
  belongs_to :category

  has_many :reviews, ->{order("created_at DESC")}
  has_many :queue_items, ->{order("position")}

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    if search_term.blank?
      []
    else
      where(["title #{DATABASE_OPERATOR[:like_operator]} ?", "%#{search_term}%"]).order("created_at DESC")
    end
  end
end