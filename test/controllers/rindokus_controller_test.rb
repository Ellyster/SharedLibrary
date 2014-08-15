require 'test_helper'

class RindokusControllerTest < ActionController::TestCase
  setup do
    @rindoku = rindokus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rindokus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rindoku" do
    assert_difference('Rindoku.count') do
      post :create, rindoku: { book_id: @rindoku.book_id, semester: @rindoku.semester, year: @rindoku.year }
    end

    assert_redirected_to rindoku_path(assigns(:rindoku))
  end

  test "should show rindoku" do
    get :show, id: @rindoku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rindoku
    assert_response :success
  end

  test "should update rindoku" do
    patch :update, id: @rindoku, rindoku: { book_id: @rindoku.book_id, semester: @rindoku.semester, year: @rindoku.year }
    assert_redirected_to rindoku_path(assigns(:rindoku))
  end

  test "should destroy rindoku" do
    assert_difference('Rindoku.count', -1) do
      delete :destroy, id: @rindoku
    end

    assert_redirected_to rindokus_path
  end
end
