require 'spec_helper'

describe Event do
  it "requires a title" do
    expect(build(:event, title: '')).to_not be_valid
  end
end
