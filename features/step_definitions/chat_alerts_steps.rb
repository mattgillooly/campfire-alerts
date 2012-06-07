Given /^a Google Alert email$/ do
  @google_alert_html = File.open(File.join(Rails.root, 'spec', 'fixtures', 'google_alert_email.html')).read
end

When /^Postmark notifies us of the inbound email$/ do
  post postmark_callbacks_path,
       SendgridSimulator.body(@google_alert_html),
       "CONTENT_TYPE" => 'application/json'
end

Then /^an alert should be posted in my Campfire room$/ do
  Chatter.should have(17).deliveries
end
