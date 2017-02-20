require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @job = Job.new(title: "Example Job", text: "Text for example job",
                   date: "2017-03-11 11:30:00 UTC", type: "Animal")
  end

  test "should be valid" do
    assert @job.valid?
  end

  test "title should not be too long" do
    @job.title = "a" * 75
    assert_not @job.valid?
  end

  test "text should not be too long" do
    @job.text = "a" * 750
    assert_not @job.valid?
  end

end
