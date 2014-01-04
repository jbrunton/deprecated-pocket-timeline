Given(/^a timeline "(.*)"$/) do |title|
  create(:timeline, title: title)
end

Given(/^a timeline "(.*)" with (\d+) events$/) do |title, events_count|
  create(:timeline, title: title) do |timeline|
    events_count.times { timeline.events.push build(:event) }
  end
end

When(/^I navigate to the timeline$/) do
  timeline = Timeline.last
  visit url_for(timeline)
end

Then(/^there should be (\d+) events visible$/) do |events_count|
  expect(page.all(".event").count).to eq(events_count)
end

When(/^I click on "(.*)"$/) do |link|
  click_on link
end

Then(/^I should be on the new event page for "(.*)"$/) do |title|
  timeline = Timeline.where(title: title).first
  expect(current_path).to eq(new_timeline_event_path(timeline))
end

Given(/^I navigate to the new event page for the timeline$/) do
  timeline = Timeline.last
  visit new_timeline_event_path(timeline)
end

Given(/^I input "(.*)" for "(.*)"$/) do |text, field|
  fill_in field, with: text
end

Then(/^I should be on the page for timeline "(.*)"$/) do |title|
  timeline = Timeline.where(title: title).first
  expect(current_path).to eq(timeline_path timeline)
end

Then(/^there should be an event entitled "(.*)" visible$/) do |title|
  expect(page.all('.event_title', text: title).count).to eq(1)
end

Then(/^there should be an error "(.*?)"$/) do |error|
  expect(page.all('#error_explanation ul li', text: error).count).to eq(1)
end

Given(/^an event "(.*?)"$/) do |title|
  create(:event, title: title)
end

Then(/^I should be on the search event page for "(.*?)"$/) do |title|
  timeline = Timeline.where(title: title).first
  expect(current_path).to eq(search_timeline_events_path(timeline))
end

When(/^I navigate to the search page for the timeline$/) do
  timeline = Timeline.last
  visit search_timeline_events_path(timeline)
end
