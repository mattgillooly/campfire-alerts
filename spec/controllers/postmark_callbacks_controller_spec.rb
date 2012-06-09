require 'spec_helper'

describe PostmarkCallbacksController do

  it "logs a POSTed email" do
    AlertProcessor.any_instance.stub(:call)

    Email.any_instance.should_receive(:body=).with('Hi hi hi hi')
    Email.any_instance.should_receive(:save!)

    post :create,
         'Subject' => 'Hello',
         'HtmlBody' => 'Hi hi hi hi',
         'From' => 'hey@example.com'

    response.should be_success
  end

  it "processes POSTed email for search alert links" do
    Email.any_instance.stub(:save!)

    AlertProcessor.any_instance.should_receive(:call)

    post :create,
         'HtmlBody' => 'asdf'

    response.should be_success
  end

  it "skips processing POSTed email if body is plaintext-only" do
    Email.any_instance.stub(:save!)

    AlertProcessor.any_instance.should_receive(:call).never

    post :create,
         'TextBody' => 'asdf',
         'HtmlBody' => ''

    response.should be_success
  end


end
