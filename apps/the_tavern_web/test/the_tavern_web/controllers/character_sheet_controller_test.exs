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
      assert html_response(conn, 200) =~ "Character sheet deleted successfully."
      refute html_response(conn, 200) =~ name
    end
  end

  describe "edit/2" do
    test "renders form for editing chosen character sheet", %{conn: conn} do
      character_sheet = insert!(:character_sheet)

      conn = get(conn, Routes.character_sheet_path(conn, :edit, character_sheet))
      assert html_response(conn, 200) =~ "Edit Character Sheet"
    end
  end

  describe "show/2" do
    test "renders a view of an existing character sheet", %{conn: conn} do
      %CharacterSheet{name: name} = character_sheet = insert!(:character_sheet)

      conn = get(conn, Routes.character_sheet_path(conn, :show, character_sheet))
      assert html_response(conn, 200) =~ "Show Character Sheet"
      assert html_response(conn, 200) =~ name
    end
  end

  describe "update/2" do
    test "redirects when data is valid", %{conn: conn} do
      character_sheet = insert!(:character_sheet)

      update_attrs =
        character_sheet
        |> Map.from_struct()
        |> Map.put(:name, "Updated Name")

      conn =
        conn
        |> put(Routes.character_sheet_path(conn, :update, character_sheet),
          character_sheet: update_attrs
        )

      assert redirected_to(conn) == Routes.character_sheet_path(conn, :show, character_sheet)

      conn = get(conn, Routes.character_sheet_path(conn, :show, character_sheet))
      assert html_response(conn, 200) =~ "Character sheet updated successfully."
      assert html_response(conn, 200) =~ "Updated Name"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      character_sheet = insert!(:character_sheet)

      invalid_attrs =
        character_sheet
        |> Map.from_struct()
        |> Map.put(:name, "")

      conn =
        put(conn, Routes.character_sheet_path(conn, :update, character_sheet),
          character_sheet: invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Character Sheet"

      assert html_response(conn, 200) =~
               "Oops, something went wrong! Please check the errors below."
    end
  end
end
