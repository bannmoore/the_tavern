defmodule TheTavernWeb.CharacterSheetControllerTest do
  use TheTavernWeb.ConnCase

  describe "index/2" do
    test "displays character sheet page.", %{conn: conn} do
      conn = get(conn, Routes.character_sheet_path(conn, :index))
      assert html_response(conn, 200) =~ "Character Sheets"
    end
  end
end
