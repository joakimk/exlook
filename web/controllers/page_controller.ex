defmodule Exlook.PageController do
  use Exlook.Web, :controller

  plug :authorize

  def index(conn, _params) do
    # in the controller for now since the Repo isn't reloaded in dev been page loads
    query = from _ in Exlook.Event, limit: 100, order_by: [ desc: :happened_at, desc: :id ]
    events = Exlook.Repo.all(query)

    render conn, "index.html", events: events
  end

  defp authorize(conn, _) do
    if conn.params["token"] == user_token do
      conn
    else
      conn |> send_resp(403, "Denied") |> halt
    end
  end

  defp user_token, do: Application.get_env(:exlook, :user_token)
end
