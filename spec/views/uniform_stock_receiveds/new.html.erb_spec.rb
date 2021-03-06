require 'spec_helper'

describe "uniform_stock_receiveds/new" do
  before(:each) do
    assign(:uniform_stock_received, stub_model(UniformStockReceived,
      :stock_id => 1,
      :quantity => 1,
      :size => "9.99",
      :received_by => 1,
      :contract_id => 1
    ).as_new_record)
  end

  it "renders new uniform_stock_received form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", uniform_stock_receiveds_path, "post" do
      assert_select "input#uniform_stock_received_stock_id[name=?]", "uniform_stock_received[stock_id]"
      assert_select "input#uniform_stock_received_quantity[name=?]", "uniform_stock_received[quantity]"
      assert_select "input#uniform_stock_received_size[name=?]", "uniform_stock_received[size]"
      assert_select "input#uniform_stock_received_received_by[name=?]", "uniform_stock_received[received_by]"
      assert_select "input#uniform_stock_received_contract_id[name=?]", "uniform_stock_received[contract_id]"
    end
  end
end
