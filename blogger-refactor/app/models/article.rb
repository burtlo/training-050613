class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list
  validates :title, :body, presence: true

  has_many :comments, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_list
    tags.collect { |tag| tag.name }.join(", ")
  end

  def tag_list=(value)
    tag_names = tag_list_to_tag_names(value)
    found_tags = tag_names.map { |name| Tag.find_or_create_by_name name }
    self.tags = found_tags
  end

  def tag_list_to_tag_names(value)
    value.to_s.split(",").map {|name| name.strip.downcase }.uniq
  end

  def self.order_options
    # call the awesome order service
    [ 'most_popular', 'most_recent', 'alphabetical', 'default' ]
  end

  def self.ordered_by(order_by)
    if order_by == 'most_popular'
      all.sort_by {|article| article.comments.count * -1 }
    elsif order_by == 'most_recent'
      order('created_at DESC')
    elsif order_by == 'alphabetical'
      order('title ASC')
    else
      order('created_at ASC')
    end
  end



end
