require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'should be created' do
    name = Faker::Commerce.department
    tag = Tag.new(name: name)
    assert(tag.save)
    assert(tag.name == name)
  end

  test 'shouldn`t be created without name' do
    tag = Tag.new(name: '')
    assert_not(tag.save)
    assert(tag.errors.messages == { name: ["can't be blank"] })
  end

  test 'should be retrieved by name' do
    tag = Tag.find_by(name: 'First tag')
    assert(tag.is_a?(Tag))
    assert(tag.name == 'First tag')
  end

  test 'should be updated' do
    tag = Tag.find_by(name: 'First tag')
    assert(tag.update(name: 'Updated tag'))
    assert(tag.name == 'Updated tag')
  end

  test 'should be destroyed' do
    tag = Tag.find_by(name: 'First tag')
    assert(tag.destroy)
  end
end
