defmodule TheTavernWeb.CharacterSheetController do
  use TheTavernWeb, :controller

  alias TheTavern.CharacterSheets
  alias TheTavern.CharacterSheets.CharacterSheet

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    character_sheets = CharacterSheets.all_character_sheets()
    render(conn, "index.html", character_sheets: character_sheets)
  end

  def new(conn, _params) do
    changeset = CharacterSheets.change_character_sheet(%CharacterSheet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"character_sheet" => character_sheet_params}) do
    case CharacterSheets.create_character_sheet(character_sheet_params) do
      {:ok, _character_sheet} ->
        conn
        |> put_flash(:info, "Character sheet created successfully.")
        |> redirect(to: Routes.character_sheet_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
