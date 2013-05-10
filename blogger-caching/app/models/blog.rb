class Blog < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :articles

  def self.find(url)
    find_by_url(url)
  end

  def to_param
    url
  end
end
