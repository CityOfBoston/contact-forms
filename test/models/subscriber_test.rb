require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  test "Subscriber should have valid zip code" do
    subscriber = Subscriber.new
    subscriber.email = "digital@boston.gov"
    subscriber.zip = "00000000"
    assert_not subscriber.save

    subscriber.zip = "adasd"
    assert_not subscriber.save

    subscriber.zip = "02110"
    assert subscriber.save

    subscriber.zip = "02110-1449"
    assert subscriber.save
  end

  test "Subscriber should have valid email address" do
    subscriber = Subscriber.new
    assert_not subscriber.save

    subscriber.email = "adsadasdasdasd"
    assert_not subscriber.save

    subscriber.email = "boston@mailinator.com"
    assert_not subscriber.save

    subscriber.email = "digital@boston.gov"
    assert subscriber.save
  end
end
