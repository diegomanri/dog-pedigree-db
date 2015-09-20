require 'test_helper'

class OwnersControllerTest < ActionController::TestCase
  setup do
    @owner = owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owner" do
    assert_difference('Owner.count') do
      post :create, owner: { ocity: @owner.ocity, oemail: @owner.oemail, ofname: @owner.ofname, olname: @owner.olname, omname: @owner.omname, opnumber: @owner.opnumber, ostate_id: @owner.ostate_id, ozip: @owner.ozip }
    end

    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should show owner" do
    get :show, id: @owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owner
    assert_response :success
  end

  test "should update owner" do
    patch :update, id: @owner, owner: { ocity: @owner.ocity, oemail: @owner.oemail, ofname: @owner.ofname, olname: @owner.olname, omname: @owner.omname, opnumber: @owner.opnumber, ostate_id: @owner.ostate_id, ozip: @owner.ozip }
    assert_redirected_to owner_path(assigns(:owner))
  end

  test "should destroy owner" do
    assert_difference('Owner.count', -1) do
      delete :destroy, id: @owner
    end

    assert_redirected_to owners_path
  end
end
