require 'test_helper'

class Api::V1::ClientsControllerTest < ActionDispatch::IntegrationTest
  test 'Client retrieval' do
    client = ClientSerializer.new clients(:one)
    get api_v1_clients_url
    assert_response :success
    assert JSON.parse(@response.body)['clients'].first == JSON.parse(client.to_json)
  end

  test 'Client creation without enrollment_ids' do
    client_params = {
      name: Faker::Artist.name,
      email: Faker::Internet.email
    }
    post api_v1_clients_url, params: client_params
    assert_response :success
    assert JSON.parse(@response.body)['name'] == client_params[:name]
    assert JSON.parse(@response.body)['email'] == client_params[:email]
  end

  test 'Client creation with enrollment_ids' do
    client_params = {
      name: Faker::Artist.name,
      email: Faker::Internet.email,
      enrollment_ids: [enrollments(:one).id]
    }
    post api_v1_clients_url, params: client_params
    assert_response :success
    assert JSON.parse(@response.body)['name'] == client_params[:name]
    assert JSON.parse(@response.body)['email'] == client_params[:email]
    assert JSON.parse(@response.body)['tags'].first['name'] == enrollments(:one).tag.name
  end

  test 'Client creation with invalid enrollment_ids' do
    client_params = {
      name: Faker::Artist.name,
      email: Faker::Internet.email,
      enrollment_ids: [0]
    }
    post api_v1_clients_url, params: client_params
    assert_response :unprocessable_entity
    assert JSON.parse(@response.body)['errors']['enrollment_ids'] == I18n.t('activerecord.errors.models.client.attributes.enrollment_ids.invalid', ids: 0)
  end

  test 'Client should no be created with invalid params' do
    client_params = {
      name: Faker::Artist.name
    }
    post api_v1_clients_url, params: client_params
    assert_response :unprocessable_entity

    client_params = {
      email: Faker::Internet.email
    }
    post api_v1_clients_url, params: client_params
    assert_response :unprocessable_entity
  end
end
