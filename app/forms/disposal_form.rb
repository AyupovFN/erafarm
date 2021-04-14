class DisposalForm
  include ActiveModel::Model

  attr_accessor :product_id, :count

  validates_presence_of :product_id, :count
  validates :count, numericality: { greater_than: 0 }
  validate :validate_products_count

  def products
    Product.all
  end

  def process
    return false unless valid?

    accept_products
  end

  private

  def validate_products_count
    errors.add(:count, :invalid) if product.count < count.to_i
  end

  def product
    Product.find(product_id)
  end

  def accept_products
    product.decrement!(:count, count.to_i)
  end
end