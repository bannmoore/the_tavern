defmodule TheTavern.Factory do
  alias TheTavern.Repo

  alias TheTavern.CharacterSheets
  alias TheTavern.CharacterSheets.CharacterSheet

  # Factories
  def attrs(:character_sheet) do
    %{
      name: Faker.Superhero.name(),
      class: Faker.Util.pick(CharacterSheets.get_class_list()),
      level: Faker.random_between(1, 20)
    }
  end

  def build(:character_sheet) do
    struct(CharacterSheet, attrs(:character_sheet))
  end

  # Convenience API
  def attrs(factory_name, attributes) do
    factory_name |> attrs() |> struct(attributes)
  end

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    Repo.insert!(build(factory_name, attributes))
  end
end
