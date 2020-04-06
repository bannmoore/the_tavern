defmodule TheTavern.Factory do
  @moduledoc """
  Helper methods for generating / inserting database models during tests.
  """

  alias TheTavern.Repo

  alias TheTavern.CharacterSheets
  alias TheTavern.CharacterSheets.CharacterSheet

  # Factories
  def attrs(:character_sheet) do
    %{
      name: Faker.Superhero.name(),
      class: Faker.Util.pick(CharacterSheets.get_class_list()),
      level: Faker.random_between(1, 20),
      ability_str: Faker.random_between(0, 30),
      ability_dex: Faker.random_between(0, 30),
      ability_con: Faker.random_between(0, 30),
      ability_int: Faker.random_between(0, 30),
      ability_wis: Faker.random_between(0, 30),
      ability_cha: Faker.random_between(0, 30)
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
