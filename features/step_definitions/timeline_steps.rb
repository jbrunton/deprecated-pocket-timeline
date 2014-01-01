Given(/^a timeline '(.*)' with (\d+) events$/) do |title, events_count|
  create(:timeline, title: title) do |timeline|
    events_count.times { timeline.events.push build(:event) }
  end
end

When(/^I navigate to the timeline '(.*)'$/) do |title|
  visit url_for Timeline.where(title: title).first
end

Then(/^there should be (\d+) events visible$/) do |events_count|
  expect(page.all(".event").count).to eq(events_count)
end
