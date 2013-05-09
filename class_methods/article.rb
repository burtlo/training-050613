require 'active_support/inflector'

class Database
  def self.configuration(options)
    puts "SETTING UP DATABASE: #{options}"
  end

  def self.query(query_string)
    puts "EXECUTING: #{query_string}"
  end
end

class BasicObject
  def self.method_missing(name,*arg,&block)
    puts "BasicObject Method Missing: #{name}"
  end
end

module FinderMethods

  def self.extended(base)
    puts "I have just been extended by class: #{base}"
  end

  def self.included(base)
    puts "I have just been included by class: #{base}"
    base.extend ClassMethods
  end

  def attributes
    self.class.attributes
  end

  module ClassMethods
    def attributes
      @attributes ||= []
    end

    def attribute(name)
      puts "Creating attribute: #{name}"

      attr_accessor name

      attributes.push(name)

      define_singleton_method "find_by_#{name}" do |*value|
        Database.query("SELECT * from #{table_name} WHERE #{name}=#{value}")
      end
    end

    def table_name(value=nil)
      if value
        @table_name = value
      else
        @table_name ||= name.underscore.pluralize
      end
    end

    def find(options={})
      Database.query("SELECT * from #{table_name} WHERE")
    end

    def all
      Database.query("SELECT * from #{table_name}")
    end

    # def method_missing(name,*args,&block)
    #   if name =~ /^find_by_/
    #     field = name.to_s.gsub(/^find_by_/,'')
    #     Database.query "SELECT * FROM #{table_name} WHERE #{field}=#{args.first}"
    #   else
    #     # puts "Method Missing received: #{name}"
    #     super
    #   end
    # end


  end
end


class Article
  include FinderMethods

  attribute :title
  attribute :body

end

class Comment
  include FinderMethods
end

class ArticleComment
  include FinderMethods

  # self.table_name = "commentary"
  table_name "commentary"

end


Article.find("something")

article = Article.new
article.title = "Gravity's Rainbow"
puts article.title
puts article.attributes
Article.find_by_title("War and Peace","Lolita")
Article.find_by_body("It was the best of times")

Comment.find("something about comments")
Comment.find_by_title("something about comments")
puts ArticleComment.table_name
puts ArticleComment.table_name("franks_table")
ArticleComment.find("something about articles comments")





