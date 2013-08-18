require 'test_helper'

class SignatureCollectionLocationsControllerTest < ActionController::TestCase
  setup do
    @signature_collection_location = signature_collection_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signature_collection_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signature_collection_location" do
    assert_difference('SignatureCollectionLocation.count') do
      post :create, signature_collection_location: { address1: @signature_collection_location.address1, address2: @signature_collection_location.address2, city: @signature_collection_location.city, latitude: @signature_collection_location.latitude, longitude: @signature_collection_location.longitude, name: @signature_collection_location.name, notes: @signature_collection_location.notes, state: @signature_collection_location.state, zip: @signature_collection_location.zip }
    end

    assert_redirected_to signature_collection_location_path(assigns(:signature_collection_location))
  end

  test "should show signature_collection_location" do
    get :show, id: @signature_collection_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signature_collection_location
    assert_response :success
  end

  test "should update signature_collection_location" do
    put :update, id: @signature_collection_location, signature_collection_location: { address1: @signature_collection_location.address1, address2: @signature_collection_location.address2, city: @signature_collection_location.city, latitude: @signature_collection_location.latitude, longitude: @signature_collection_location.longitude, name: @signature_collection_location.name, notes: @signature_collection_location.notes, state: @signature_collection_location.state, zip: @signature_collection_location.zip }
    assert_redirected_to signature_collection_location_path(assigns(:signature_collection_location))
  end

  test "should destroy signature_collection_location" do
    assert_difference('SignatureCollectionLocation.count', -1) do
      delete :destroy, id: @signature_collection_location
    end

    assert_redirected_to signature_collection_locations_path
  end
end
