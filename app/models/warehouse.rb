class Warehouse < ApplicationRecord
  has_many :products, dependent: :nullify
end
