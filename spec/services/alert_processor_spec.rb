require 'spec_helper'

describe AlertProcessor do

  it "parses alert emails and posts links to the chat room" do
    html = "my big email body"
    email = stub(:email, html_body: html)

    r1 = stub(:result, to_s: 'first result').as_null_object
    r2 = stub(:result, to_s: 'second result').as_null_object

    chatter = stub(:chatter)

    GoogleAlerts.stub(:parse_email).with(html).and_return([r1, r2])
    Chatter.stub(:new).and_return(chatter)

    chatter.should_receive(:post_link).with(r1.to_s)
    chatter.should_receive(:post_link).with(r2.to_s)

    Link.should_receive(:create!).twice

    subject.call(email)
  end

end
