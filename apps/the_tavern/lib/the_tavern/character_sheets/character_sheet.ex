defmodule TheTavern.CharacterSheets.CharacterSheet do
  @moduledoc """
  This schema represents a character sheet.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @attrs [
    :class,
    :level,
    :name,
    :ability_str,
    :ability_dex,
    :ability_con,
    :ability_int,
    :ability_wis,
    :ability_cha
  ]

  schema "character_sheets" do
    field(:class, :string)
    field(:level, :integer)
    field(:name, :string)
    field(:ability_str, :integer, default: 10)
    field(:ability_dex, :integer, default: 10)
    field(:ability_con, :integer, default: 10)
    field(:ability_int, :integer, default: 10)
    field(:ability_wis, :integer, default: 10)
    field(:ability_cha, :integer, default: 10)

    timestamps()
  end

  @doc false
  def changeset(character_sheet, attrs) do
    character_sheet
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
  end
end
