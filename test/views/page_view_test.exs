defmodule Exlook.PageViewTest do
  use Exlook.ConnCase, async: true

  alias Exlook.PageView
  alias Exlook.Event

  test "identicon returns a unique icon for each smtp-id" do
    event1 = %Event{data: %{"smtp-id": "a"}}
    event2 = %Event{data: %{"smtp-id": "a"}}
    event3 = %Event{data: %{"smtp-id": "b"}}

    assert inspect(PageView.identicon(event1)) =~ "<img"
    assert PageView.identicon(event1) == PageView.identicon(event2)
    assert PageView.identicon(event1) != PageView.identicon(event3)
  end

  test "data_if_present returns formatted data when present" do
    [ safe: data ] = PageView.data_if_present(%{some: "data"})
  end

  test "data_if_present returns a blank string when given an empty map" do
    data = PageView.data_if_present(%{})
    assert data == ""
  end
end
