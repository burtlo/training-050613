class CommentSerializer < ActiveModel::Serializer
  attributes :author, :body
end