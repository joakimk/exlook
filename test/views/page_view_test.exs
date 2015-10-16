defmodule Exlook.PageViewTest do
  use Exlook.ConnCase, async: true

  alias Exlook.PageView

  test "data_if_present returns formatted data when present" do
    [ safe: data ] = PageView.data_if_present(%{some: "data"})
  end

  test "data_if_present returns a blank string when given an empty map" do
    data = PageView.data_if_present(%{})
    assert data == ""
  end
end
