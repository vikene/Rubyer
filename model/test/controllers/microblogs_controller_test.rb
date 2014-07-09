require 'test_helper'

class MicroblogsControllerTest < ActionController::TestCase
  setup do
    @microblog = microblogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:microblogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create microblog" do
    assert_difference('Microblog.count') do
      post :create, microblog: { content: @microblog.content, tag: @microblog.tag, user_id: @microblog.user_id }
    end

    assert_redirected_to microblog_path(assigns(:microblog))
  end

  test "should show microblog" do
    get :show, id: @microblog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @microblog
    assert_response :success
  end

  test "should update microblog" do
    patch :update, id: @microblog, microblog: { content: @microblog.content, tag: @microblog.tag, user_id: @microblog.user_id }
    assert_redirected_to microblog_path(assigns(:microblog))
  end

  test "should destroy microblog" do
    assert_difference('Microblog.count', -1) do
      delete :destroy, id: @microblog
    end

    assert_redirected_to microblogs_path
  end
end
