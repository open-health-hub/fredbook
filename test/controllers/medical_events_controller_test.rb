require 'test_helper'

class MedicalEventsControllerTest < ActionController::TestCase
  setup do
    @medical_event = medical_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_event" do
    assert_difference('MedicalEvent.count') do
      post :create, medical_event: { description: @medical_event.description, occurred_at: @medical_event.occurred_at, summary: @medical_event.summary, user_id: @medical_event.user_id }
    end

    assert_redirected_to medical_event_path(assigns(:medical_event))
  end

  test "should show medical_event" do
    get :show, id: @medical_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_event
    assert_response :success
  end

  test "should update medical_event" do
    patch :update, id: @medical_event, medical_event: { description: @medical_event.description, occurred_at: @medical_event.occurred_at, summary: @medical_event.summary, user_id: @medical_event.user_id }
    assert_redirected_to medical_event_path(assigns(:medical_event))
  end

  test "should destroy medical_event" do
    assert_difference('MedicalEvent.count', -1) do
      delete :destroy, id: @medical_event
    end

    assert_redirected_to medical_events_path
  end
end
