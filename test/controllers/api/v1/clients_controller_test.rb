require 'test_helper'

class Api::V1::ClientsControllerTest < ActionDispatch::IntegrationTest
  test 'Client retrieval' do
    client = ClientSerializer.new clients(:one)
    get api_v1_clients_url
    assert_response :success
    assert JSON.parse(@response.body).first == JSON.parse(client.to_json)
  end
end
