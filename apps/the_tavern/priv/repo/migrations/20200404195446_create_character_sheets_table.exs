defmodule TheTavern.Repo.Migrations.CreateCharacterSheetsTable do
  use Ecto.Migration

  def change do
    create table(:character_sheets) do
      add(:class, :string)
      add(:level, :integer)
      add(:name, :string)

      timestamps()
    end
  end
end
