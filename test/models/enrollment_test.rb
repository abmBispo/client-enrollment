require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  test 'should be created' do
    client = Client.first
    tag = Tag.first

    enrollment = Enrollment.new(client: client, tag: tag, name: 'First Enrollment')
    assert(enrollment.save)
  end

  test 'should be retrieved' do
    enrollment = Enrollment.first
    assert(enrollment.is_a?(Enrollment))
    assert(enrollment.name == 'First enrollment')
  end
end
