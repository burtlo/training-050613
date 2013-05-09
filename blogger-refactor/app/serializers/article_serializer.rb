class ArticleSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :rating
  has_many :comments

  def created_at
    object.created_at.strftime("%A %M")
  end

  def rating
    comments.count * 100
  end
end