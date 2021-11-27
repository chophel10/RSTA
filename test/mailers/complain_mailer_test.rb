require "test_helper"

class ComplainMailerTest < ActionMailer::TestCase
  test "comment" do
    mail = ComplainMailer.comment
    assert_equal "Comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "assign" do
    mail = ComplainMailer.assign
    assert_equal "Assign", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "resolve" do
    mail = ComplainMailer.resolve
    assert_equal "Resolve", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
