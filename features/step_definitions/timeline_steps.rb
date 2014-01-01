Given(/^a timeline '(.*)'$/) do |title|
  create(:timeline, title: title)
end

Given(/^a timeline '(.*)' with (\d+) events$/) do |title, events_count|
  create(:timeline, title: title) do |timeline|
    events_count.times { timeline.events.push build(:event) }
  end
end

When(/^I navigate to the timeline '(.*)'$/) do |title|
  timeline = Timeline.where(title: title).first
  visit url_for(timeline)
end

Then(/^there should be (\d+) events visible$/) do |events_count|
  expect(page.all(".event").count).to eq(events_count)
end

When(/^I click on '(.*)'$/) do |link|
  click_link link
end

Then(/^I should be on the new event page for '(.*)'$/) do |title|
  timeline = Timeline.where(title: title).first
  expect(current_path).to eq(new_timeline_event_path(timeline))
end
