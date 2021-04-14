require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        count: 2,
        category: "",
        article: 3,
        warehouse: ""
      ),
      Product.create!(
        name: "Name",
        count: 2,
        category: "",
        article: 3,
        warehouse: ""
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
