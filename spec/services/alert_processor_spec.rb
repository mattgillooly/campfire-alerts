require 'spec_helper'

describe AlertProcessor do

  it "parses alert emails and posts links to the chat room" do
    html = stub(:html)

    r1 = stub(:result, to_s: 'first result')
    r2 = stub(:result, to_s: 'second result')

    alert = stub(:alert, results: [r1, r2])
    chatter = stub(:chatter)

    GoogleAlert.stub(:new).with(html).and_return(alert)
    Chatter.stub(:new).and_return(chatter)

    chatter.should_receive(:post_link).with(r1.to_s)
    chatter.should_receive(:post_link).with(r2.to_s)

    subject.call(html)
  end

end
