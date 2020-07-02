require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'should be created' do
    name = Faker::Artist.name
    email = Faker::Internet.email
    client = Client.new(name: name, email: email)
    assert(client.save)
    assert(client.name == name)
    assert(client.email == email)
  end

  test 'shouldn`t be created without required fields' do
    name = Faker::Artist.name
    email = Faker::Internet.email
    client = Client.new(name: name, email: '')
    assert_not(client.save)
    assert(client.errors.messages == { email: ["can't be blank", "is invalid"] })
    client = Client.new(name: '', email: email)
    assert_not(client.save)
    assert(client.errors.messages == { name: ["can't be blank"] })
  end

  test 'shouldn`t be created with wrong email format' do
    name = Faker::Artist.name
    client = Client.new(name: name, email: 'aaa.com')
    assert_not(client.save)
    assert(client.errors.messages == { email: ['is invalid'] })
  end

  test 'should be updated' do
    client = Client.first
    assert(client.update(name: 'Josué da Silva'))
    assert(client.update(email: 'josue@dasilva.com'))
  end

  test 'shouldn`t be updated' do
    client = Client.first
    assert_not(client.update(name: ''))
    assert(client.errors.messages == { name: ["can't be blank"] })
    client = Client.first
    assert_not(client.update(email: ''))
    assert(client.errors.messages == { email: ["can't be blank", "is invalid"] })
  end

  test 'should be retrived by email' do
    client = Client.find_by(email: 'sr.alan.bispo@gmail.com')
    assert(client.is_a?(Client))
    assert(client.email == 'sr.alan.bispo@gmail.com')
  end

  test 'should be destroyed' do
    client = Client.first
    client.destroy
  end
end
