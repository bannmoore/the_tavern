defmodule TheTavern.CharacterSheets do
  @moduledoc """
   This context provides methods for managing character sheets.
  """

  use EctoResource

  alias TheTavern.CharacterSheets.CharacterSheet
  alias TheTavern.Repo

  using_repo(Repo) do
    resource(CharacterSheet, only: [:all, :change, :create, :delete, :get])
  end

  def get_class_list do
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
