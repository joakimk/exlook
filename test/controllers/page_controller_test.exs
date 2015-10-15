defmodule Exlook.PageControllerTest do
  use Exlook.ConnCase

  alias Exlook.Event

  test "lists events" do
    event = %Event{email: "foo@example.com"}
    Exlook.Repo.insert!(event)

    conn = get conn(), "/?token=secret"
    assert html_response(conn, 200) =~ "foo@example.com"
  end

  test "prevents access when the access token is wrong" do
    conn = get conn(), "/?token=invalid"
    assert conn.status == 403
  end
end
