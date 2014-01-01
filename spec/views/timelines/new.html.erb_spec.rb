require 'spec_helper'

describe "timelines/new" do
  before(:each) do
    assign(:timeline, stub_model(Timeline,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new timeline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", timelines_path, "post" do
      assert_select "input#timeline_title[name=?]", "timeline[title]"
      assert_select "textarea#timeline_description[name=?]", "timeline[description]"
    end
  end
end
