require 'test_helper'

class Api::V1::TagsControllerTest < ActionDispatch::IntegrationTest
  test 'Tag should be created with valid params' do
    tag_params = {
      name: Faker::Commerce.department
    }
    post api_v1_tags_url, params: tag_params
    assert_response :success
    assert JSON.parse(@response.body)['name'] == tag_params[:name]
  end

  test 'Tag shouldn`t be created with invalid params' do
    tag_params = {
      name: 'Eletronics'
    }
    post api_v1_tags_url, params: tag_params
    assert_response :unprocessable_entity
    assert JSON.parse(@response.body)['errors']['name'].first == I18n.t('activerecord.errors.models.tag.attributes.name.taken')
  end
end
