require 'test_helper'

class OrganizacionsControllerTest < ActionController::TestCase
  setup do
    @organizacion = organizacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organizacion" do
    assert_difference('Organizacion.count') do
      post :create, organizacion: { estatus: @organizacion.estatus, nombre: @organizacion.nombre, subdominio: @organizacion.subdominio }
    end

    assert_redirected_to organizacion_path(assigns(:organizacion))
  end

  test "should show organizacion" do
    get :show, id: @organizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organizacion
    assert_response :success
  end

  test "should update organizacion" do
    patch :update, id: @organizacion, organizacion: { estatus: @organizacion.estatus, nombre: @organizacion.nombre, subdominio: @organizacion.subdominio }
    assert_redirected_to organizacion_path(assigns(:organizacion))
  end

  test "should destroy organizacion" do
    assert_difference('Organizacion.count', -1) do
      delete :destroy, id: @organizacion
    end

    assert_redirected_to organizacions_path
  end
end
