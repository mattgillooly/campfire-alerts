Feature: Chat Alerts

  As someone interested in following a topic
  In order to get the latest news
  I wish to read alerts about that topic in my Campfire room

  Scenario: Google Alerts sends email
    Given a Google Alert email
    When Postmark notifies us of the inbound email
    Then an alert should be posted in my Campfire room

