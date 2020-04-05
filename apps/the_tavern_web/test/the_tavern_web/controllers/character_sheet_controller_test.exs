defmodule TheTavernWeb.CharacterSheetControllerTest do
  use TheTavernWeb.ConnCase

  import TheTavern.Factory

  alias TheTavern.CharacterSheets.CharacterSheet

  describe "index/2" do
    test "displays character sheet page.", %{conn: conn} do
      conn = get(conn, Routes.character_sheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Character Sheets"
    end

    test "display list of available character sheets", %{conn: conn} do
      %CharacterSheet{name: name} = insert!(:character_sheet)

      conn = get(conn, Routes.character_sheet_path(conn, :index))
      assert html_response(conn, 200) =~ name
    end
  end

  describe "new/2" do
    test "displays new character sheet form", %{conn: conn} do
      conn = get(conn, Routes.character_sheet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Character Sheet"
    end
  end

  describe "create/2" do
    test "redirects to index when data is valid", %{conn: conn} do
      valid_attrs = attrs(:character_sheet)

      conn = post(conn, Routes.character_sheet_path(conn, :create), character_sheet: valid_attrs)

      assert %{} = redirected_params(conn)
      assert redirected_to(conn) == Routes.character_sheet_path(conn, :index)

      conn = get(conn, Routes.character_sheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Character Sheets"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      invalid_attrs = %{}

      conn =
        post(conn, Routes.character_sheet_path(conn, :create), character_sheet: invalid_attrs)

      assert html_response(conn, 200) =~ "New Character Sheet"
    end
  end

  describe "delete/2" do
    test "deletes character_sheet", %{conn: conn} do
      %CharacterSheet{name: name} = character_sheet = insert!(:character_sheet)

      conn = get(conn, Routes.character_sheet_path(conn, :index))
      assert html_response(conn, 200) =~ name

      conn = delete(conn, Routes.character_sheet_path(conn, :delete, character_sheet))
      assert redirected_to(conn) == Routes.character_sheet_path(conn, :index)

      conn = get(conn, Routes.character_sheet_path(conn, :index))
      refute html_response(conn, 200) =~ name
    end
  end
end
