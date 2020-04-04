defmodule TheTavern.CharacterSheets.CharacterSheet do
  @moduledoc """
  This schema represents a character sheet.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @attrs [:class, :level, :name]

  schema "character_sheets" do
    field(:class, :string)
    field(:level, :integer)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(character_sheet, attrs) do
    character_sheet
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
  end
end
