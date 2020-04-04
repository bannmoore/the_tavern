defmodule TheTavern.CharacterSheets do
  @moduledoc """
  This context provides methods for managing character sheets.
  """

  alias TheTavern.CharacterSheets.CharacterSheet
  alias TheTavern.Repo

  @spec change_character_sheet(CharacterSheet.t()) :: Changeset.t()
  def change_character_sheet(%CharacterSheet{} = character_sheet) do
    CharacterSheet.changeset(character_sheet, %{})
  end

  @spec create_character_sheet(Map.t()) :: {:ok, Schema.t()} | {:error, Changeset.t()}
  def create_character_sheet(attrs \\ %{}) do
    %CharacterSheet{}
    |> CharacterSheet.changeset(attrs)
    |> Repo.insert()
  end

  @spec get_character_sheets :: list(CharacterSheet.t())
  def get_character_sheets do
    Repo.all(CharacterSheet)
  end

  def get_class_list() do
    [
      "Barbarian",
      "Bard",
      "Cleric",
      "Druid",
      "Fighter",
      "Monk",
      "Paladin",
      "Ranger",
      "Rogue",
      "Sorcerer",
      "Warlock",
      "Wizard"
    ]
  end
end
