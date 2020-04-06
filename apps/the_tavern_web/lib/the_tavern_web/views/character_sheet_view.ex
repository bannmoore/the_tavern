defmodule TheTavernWeb.CharacterSheetView do
  use TheTavernWeb, :view

  alias TheTavern.CharacterSheets

  @spec get_class_options :: [<<_::32, _::_*8>>, ...]
  def get_class_options do
    CharacterSheets.get_class_list()
  end

  def ability_input(form, field) do
    ~E"""
    <%= number_input form, field, min: 0, max: 30 %>
    """
  end

  @spec render_modifier(integer) :: binary
  def render_modifier(ability_score) do
    modifier = calculate_modifier(ability_score)
    sign = if modifier < 0, do: "", else: "+"

    "#{sign}#{modifier}"
  end

  defp calculate_modifier(ability_score) do
    Integer.floor_div(ability_score - 10, 2)
  end
end
