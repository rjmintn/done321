require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :name => "Name",
        :description => "Description",
        :user => nil,
        :create_by => "",
        :list => nil,
        :priority => 2,
        :duration => 3,
        :repeat => ""
      ),
      Item.create!(
        :name => "Name",
        :description => "Description",
        :user => nil,
        :create_by => "",
        :list => nil,
        :priority => 2,
        :duration => 3,
        :repeat => ""
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
