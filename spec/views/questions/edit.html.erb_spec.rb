require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :text => "MyString",
      :event => nil
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_text[name=?]", "question[text]"
      assert_select "input#question_event_id[name=?]", "question[event_id]"
    end
  end
end
