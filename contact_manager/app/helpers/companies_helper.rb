module CompaniesHelper

  def hello_tag
    content_tag :div, class: "hello" do
      "!!!!! COMPANY !!!! REALLY, you're looking for me!"
    end
  end


end
