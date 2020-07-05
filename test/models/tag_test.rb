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
    assert(tag.errors.messages == { name: [I18n.t('activerecord.errors.models.tag.attributes.name.blank')] })
  end

  test 'should be retrieved by name' do
    tag = Tag.find_by(name: 'Eletronics')
    assert(tag.is_a?(Tag))
    assert(tag.name == 'Eletronics')
  end

  test 'should be updated' do
    tag = Tag.find_by(name: 'Eletronics')
    assert(tag.update(name: 'Eletronix'))
    assert(tag.name == 'Eletronix')
  end

  test 'should be destroyed' do
    tag = Tag.find_by(name: 'Eletronics')
    assert(tag.destroy)
  end
end
