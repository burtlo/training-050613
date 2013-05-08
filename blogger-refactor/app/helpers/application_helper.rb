module ApplicationHelper

  def awesome_helper(input)
    if params[:order_by] && input
      @article
    else
      Article.first
    end
  end
end
