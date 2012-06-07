require 'spec_helper'

describe PostmarkCallbacksController do

  let(:alert_body) { stub(:html) }
  let(:email) { stub(:email, body: alert_body) }

  it "logs a POSTed email" do
    AlertProcessor.any_instance.stub(:call)

    Email.should_receive(:create!).
      with( subject: 'Hello',
            body: 'Hi hi hi hi',
            from: 'hey@example.com').
      and_return(email)

    post :create,
         'Subject' => 'Hello',
         'HtmlBody' => 'Hi hi hi hi',
         'From' => 'hey@example.com'

    response.should be_success
  end

  it "processes POSTed email for search alert links" do
    Email.stub(:create!).and_return(email)

    AlertProcessor.any_instance.should_receive(:call).with(alert_body)

    post :create
    response.should be_success
  end

end
