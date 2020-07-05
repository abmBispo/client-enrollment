require 'test_helper'

class Api::V1::EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test 'Enrollment should be created with valid params' do
    enrollment_params = {
      name: Faker::Commerce.department,
      client_id: clients(:one).id,
      tag_id: tags(:one).id
    }
    post api_v1_enrollments_url, params: enrollment_params
    assert_response :success
    assert JSON.parse(@response.body)['name'] == enrollment_params[:name]
  end

  test 'Enrollment shouldn`t be created with invalid params' do
    enrollment_params = {
      name: 'First enrollment',
      client_id: clients(:one).id,
      tag_id: tags(:one).id
    }
    post api_v1_enrollments_url, params: enrollment_params
    assert_response :unprocessable_entity
    assert JSON.parse(@response.body)['errors']['name'].first == I18n.t('activerecord.errors.models.enrollment.attributes.name.taken')
  end
end
