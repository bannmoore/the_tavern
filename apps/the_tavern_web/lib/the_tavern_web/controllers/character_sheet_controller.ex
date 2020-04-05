defmodule TheTavernWeb.CharacterSheetController do
  use TheTavernWeb, :controller

  alias TheTavern.CharacterSheets
  alias TheTavern.CharacterSheets.CharacterSheet

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    character_sheets = CharacterSheets.all_character_sheets()
    render(conn, "index.html", character_sheets: character_sheets)
  end

  @spec new(Plug.Conn.t(), any) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = CharacterSheets.change_character_sheet(%CharacterSheet{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
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

  @spec delete(Plug.Conn.t(), map) :: Plug.Conn.t()
  def delete(conn, %{"id" => id}) do
    character_sheet = CharacterSheets.get_character_sheet(id)
    {:ok, _character_sheet} = CharacterSheets.delete_character_sheet(character_sheet)

    conn
    |> put_flash(:info, "Character sheet deleted successfully.")
    |> redirect(to: Routes.character_sheet_path(conn, :index))
  end

  @spec edit(Plug.Conn.t(), map) :: Plug.Conn.t()
  def edit(conn, %{"id" => id}) do
    character_sheet = CharacterSheets.get_character_sheet(id)
    changeset = CharacterSheets.change_character_sheet(character_sheet)
    render(conn, "edit.html", character_sheet: character_sheet, changeset: changeset)
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    character_sheet = CharacterSheets.get_character_sheet(id)
    render(conn, "show.html", character_sheet: character_sheet)
  end

  def update(conn, %{"id" => id, "character_sheet" => character_sheet_params}) do
    character_sheet = CharacterSheets.get_character_sheet(id)

    case CharacterSheets.update_character_sheet(character_sheet, character_sheet_params) do
      {:ok, character_sheet} ->
        conn
        |> put_flash(:info, "Character sheet updated successfully.")
        |> redirect(to: Routes.character_sheet_path(conn, :show, character_sheet))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", character_sheet: character_sheet, changeset: changeset)
    end
  end
end
