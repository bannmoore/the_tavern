defmodule TheTavernWeb.CharacterSheetViewTest do
  use TheTavernWeb.ConnCase, async: true

  alias TheTavernWeb.CharacterSheetView

  describe "render_modifier/1" do
    test "calculates positive modifier" do
      assert "+3" == CharacterSheetView.render_modifier(16)
    end

    test "calculate negative modifier" do
      assert "-1" == CharacterSheetView.render_modifier(8)
    end

    test "calculate neutral modifier" do
      assert "+0" == CharacterSheetView.render_modifier(10)
    end
  end
end
