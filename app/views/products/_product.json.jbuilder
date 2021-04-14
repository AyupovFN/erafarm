json.extract! product, :id, :name, :count, :category, :article, :warehouse, :created_at, :updated_at
json.url product_url(product, format: :json)
