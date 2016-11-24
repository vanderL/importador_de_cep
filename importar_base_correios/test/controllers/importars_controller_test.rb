require 'test_helper'

class ImportarsControllerTest < ActionController::TestCase
  setup do
    @importar = importars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:importars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create importar" do
    assert_difference('Importar.count') do
      post :create, importar: {  }
    end

    assert_redirected_to importar_path(assigns(:importar))
  end

  test "should show importar" do
    get :show, id: @importar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @importar
    assert_response :success
  end

  test "should update importar" do
    patch :update, id: @importar, importar: {  }
    assert_redirected_to importar_path(assigns(:importar))
  end

  test "should destroy importar" do
    assert_difference('Importar.count', -1) do
      delete :destroy, id: @importar
    end

    assert_redirected_to importars_path
  end
end
