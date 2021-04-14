require 'rails_helper'

RSpec.describe "warehouses/edit", type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!(
      name: "MyString",
      address: "MyString"
    ))
  end

  it "renders the edit warehouse form" do
    render

    assert_select "form[action=?][method=?]", warehouse_path(@warehouse), "post" do

      assert_select "input[name=?]", "warehouse[name]"

      assert_select "input[name=?]", "warehouse[address]"
    end
  end
end
