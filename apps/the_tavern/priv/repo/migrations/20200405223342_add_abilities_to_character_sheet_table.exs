defmodule TheTavern.Repo.Migrations.AddAbilitiesToCharacterSheetTable do
  use Ecto.Migration

  def change do
    alter table(:character_sheets) do
      add :ability_str, :integer, default: 10
      add :ability_dex, :integer, default: 10
      add :ability_con, :integer, default: 10
      add :ability_int, :integer, default: 10
      add :ability_wis, :integer, default: 10
      add :ability_cha, :integer, default: 10
    end
  end
end
