require 'spec_helper'

describe PostmarkCallbacksController do

  let(:email) { stub(:email) }

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

    AlertProcessor.any_instance.should_receive(:call).with(email)

    post :create,
         'HtmlBody' => ''

    response.should be_success
  end

end
