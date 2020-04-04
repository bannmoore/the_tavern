defmodule TheTavernWeb.CharacterSheetView do
  use TheTavernWeb, :view

  alias TheTavern.CharacterSheets

  def get_class_options() do
    CharacterSheets.get_class_list()
  end
end
