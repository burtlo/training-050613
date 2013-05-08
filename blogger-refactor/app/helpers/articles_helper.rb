module ArticlesHelper

  # <% if @articles.empty? %>
  #   <%= render partial: "no_articles" %>
  # <% elsif @articles.count == 1  %>
  #   <%= render partial: "one_article", locals: { article: @articles.first } %>
  # <% else %>
  #   <%= render partial: "article", collection: @articles %>
  # <% end %>

  def render_articles_template(articles)
    if articles.empty?
      render partial: "no_articles"
    elsif articles.count == 1
      render partial: "one_article", locals: { article: articles.first }
    else
      render partial: "article", collection: articles
    end
  end

  def articles_template(articles)
    if articles.empty?
      { partial: "no_articles" }
    elsif articles.count == 1
      { partial: "one_article", locals: { article: articles.first } }
    else
      { partial: "article", collection: articles }
    end
  end

  def especial_articles_template(articles)
    if articles.empty?
      "no_articles"
    elsif articles.count == 1
      "one_article"
    else
      "article"
    end
  end


end