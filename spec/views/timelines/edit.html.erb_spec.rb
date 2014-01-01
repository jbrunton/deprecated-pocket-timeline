require 'spec_helper'

describe "timelines/edit" do
  before(:each) do
    @timeline = assign(:timeline, stub_model(Timeline,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit timeline form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", timeline_path(@timeline), "post" do
      assert_select "input#timeline_title[name=?]", "timeline[title]"
      assert_select "textarea#timeline_description[name=?]", "timeline[description]"
    end
  end
end
