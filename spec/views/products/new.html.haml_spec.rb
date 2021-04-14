require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      name: "MyString",
      count: 1,
      category: "",
      article: 1,
      warehouse: ""
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[count]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[article]"

      assert_select "input[name=?]", "product[warehouse]"
    end
  end
end
