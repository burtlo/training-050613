require 'spec_helper'


describe ProductRecommender do
  let(:subject) { described_class.new "user", "marketing mobojumbo", "products" }

  describe '#recommended_products' do
    it 'returns the correct list of products' do
      expect(subject.recommended_products).to have(3).items
      expect(subject.recommended_products).to eq([:product1, :product2, :product3])
    end
  end
end