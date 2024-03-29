require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :text => "Text",
        :event => nil
      ),
      stub_model(Question,
        :text => "Text",
        :event => nil
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
