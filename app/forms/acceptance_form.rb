class AcceptanceForm
  include ActiveModel::Model

  attr_accessor :product_id, :count

  validates_presence_of :product_id, :count
  validates :count, numericality: { greater_than: 0 }

  def products
    Product.all
  end

  def process
    return false unless valid?

    accept_products
  end

  private

  def product
    Product.find(product_id)
  end

  def accept_products
    product.increment!(:count, count.to_i)
  end
end