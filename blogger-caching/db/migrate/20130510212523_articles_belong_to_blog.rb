class ArticlesBelongToBlog < ActiveRecord::Migration

  class Blog < ActiveRecord::Base ; end
  class Article < ActiveRecord::Base ; end

  def up
    add_column :articles, :blog_id, :integer

    blog = Blog.first

    Article.transaction do

      Article.all.each do |article|
        article.blog_id = blog.id
        article.save
      end

    end

  end

  def down
    remove_column :articles, :blog_id
  end
end
