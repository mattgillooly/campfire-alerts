require 'spec_helper'
require 'google_alert'

describe GoogleAlert do

  it "parses a Google Alerts HTML email" do
    email_html = File.open(File.join(Rails.root, 'spec', 'fixtures', 'google_alert_email.html')).read

    alert = GoogleAlert.new(email_html)

    alert.should have(17).results

    r = alert.results.first

    r.link.should == "http://www.google.com/url?sa=X&q=http://www.denverpost.com/news/ci_20789574/food-trucks-return-civic-center-eats&ct=ga&cad=CAcQAhgAIAAoATAAOABAlZG7_gRIAVAAWABiBWVuLVVT&cd=rZSXwm2IACg&usg=AFQjCNE3qLvKs77NAMarRsJvychLhygQ4w"

    r.title.should == "Food trucks return for Civic Center EATS"

    r.source.should == "Denver Post"

    r.blurb.should == %{"We were both kind of tired of our jobs, and my sister said, 'well, why don't you guys start a food truck," Mandel, 27, said. For Cunningham, 30, "food truck" was no foreign concept. In fact, 1976 his parents started RollinGreens, a Boulder-based ...}

  end

end
