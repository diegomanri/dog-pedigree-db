require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  setup do
    @dog = dogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post :create, dog: { avatar: @dog.avatar, breed: @dog.breed, dcomments: @dog.dcomments, dname: @dog.dname, dob: @dog.dob, health: @dog.health, height: @dog.height, occupation: @dog.occupation, pedinum: @dog.pedinum, user_id: @dog.user_id, variety: @dog.variety, weight: @dog.weight, workcert: @dog.workcert }
    end

    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should show dog" do
    get :show, id: @dog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dog
    assert_response :success
  end

  test "should update dog" do
    patch :update, id: @dog, dog: { avatar: @dog.avatar, breed: @dog.breed, dcomments: @dog.dcomments, dname: @dog.dname, dob: @dog.dob, health: @dog.health, height: @dog.height, occupation: @dog.occupation, pedinum: @dog.pedinum, user_id: @dog.user_id, variety: @dog.variety, weight: @dog.weight, workcert: @dog.workcert }
    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete :destroy, id: @dog
    end

    assert_redirected_to dogs_path
  end
end
