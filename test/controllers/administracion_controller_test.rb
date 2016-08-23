require 'test_helper'

class AdministracionControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get administracion_login_url
    assert_response :success
  end

  test "should get agregar_fotos" do
    get administracion_agregar_fotos_url
    assert_response :success
  end

end
