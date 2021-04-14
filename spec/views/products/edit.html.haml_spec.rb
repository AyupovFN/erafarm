require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "MyString",
      count: 1,
      category: "",
      article: 1,
      warehouse: ""
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[count]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[article]"

      assert_select "input[name=?]", "product[warehouse]"
    end
  end
end
