require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :name => "MyString",
      :description => "MyString",
      :user => nil,
      :create_by => "",
      :list => nil,
      :priority => 1,
      :duration => 1,
      :repeat => ""
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"

      assert_select "input#item_create_by[name=?]", "item[create_by]"

      assert_select "input#item_list_id[name=?]", "item[list_id]"

      assert_select "input#item_priority[name=?]", "item[priority]"

      assert_select "input#item_duration[name=?]", "item[duration]"

      assert_select "input#item_repeat[name=?]", "item[repeat]"
    end
  end
end
