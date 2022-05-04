require "application_system_test_case"

class LocaisTest < ApplicationSystemTestCase
  setup do
    @local = locais(:one)
  end

  test "visiting the index" do
    visit locais_url
    assert_selector "h1", text: "Locais"
  end

  test "should create local" do
    visit locais_url
    click_on "New local"

    fill_in "Bairro", with: @local.bairro
    fill_in "Logradouro", with: @local.logradouro
    fill_in "Numero", with: @local.numero
    fill_in "Referencia", with: @local.referencia
    click_on "Create Local"

    assert_text "Local was successfully created"
    click_on "Back"
  end

  test "should update Local" do
    visit local_url(@local)
    click_on "Edit this local", match: :first

    fill_in "Bairro", with: @local.bairro
    fill_in "Logradouro", with: @local.logradouro
    fill_in "Numero", with: @local.numero
    fill_in "Referencia", with: @local.referencia
    click_on "Update Local"

    assert_text "Local was successfully updated"
    click_on "Back"
  end

  test "should destroy Local" do
    visit local_url(@local)
    click_on "Destroy this local", match: :first

    assert_text "Local was successfully destroyed"
  end
end
