require 'spec_helper'

describe Chatter do

  before do
    Chatter.subdomain = 'boogers'
    Chatter.token = 'asdfasdf'
    Chatter.room_name = '#farts'
  end

  it "gets its chat room" do
    room = stub(:room)
    campfire_session = stub(:campfire_session)

    Tinder::Campfire.should_receive(:new).
      with('boogers', token: 'asdfasdf').
      and_return(campfire_session)

    campfire_session.stub(:find_room_by_name).
      with('#farts').
      and_return(room)

    subject.room.should == room
  end

  it "posts to a chat room" do
    Chatter.delivery_method = :deliver

    foo = stub(:thing_to_post)
    fake_room = stub(:room)
    subject.stub(:room).and_return(fake_room)
    fake_room.should_receive(:speak).with(foo)
    subject.post_link(foo)

    Chatter.delivery_method = :test
  end

  it "keeps a backlog of posts in test mode" do
    line = "Let's test this thing!"
    subject.post_link(line)
    subject.should have(1).deliveries

    d = subject.deliveries.first
    d.should == line
  end

end
