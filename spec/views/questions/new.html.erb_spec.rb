require 'spec_helper'

describe "questions/new" do
  before(:each) do
    assign(:question, stub_model(Question,
      :text => "MyString",
      :event => nil
    ).as_new_record)
  end

  it "renders new question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", questions_path, "post" do
      assert_select "input#question_text[name=?]", "question[text]"
      assert_select "input#question_event_id[name=?]", "question[event_id]"
    end
  end
end
