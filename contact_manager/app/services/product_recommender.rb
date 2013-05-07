class ProductRecommender
  def initialize(user,marketing_promotions,products)
    # DO SOME WORK
    @user = user
    @marketing_promotions = marketing_promotions
    @products = products
  end

  def recommended_products
    if @user and @marketing_promotions and @products
      [ :product1, :product2, :product3 ]
    else
      []
    end
  end
end