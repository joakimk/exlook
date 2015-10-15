defmodule Exlook.PageController do
  use Exlook.Web, :controller

  plug :authorize

  def index(conn, _params) do
    render conn, "index.html", events: Exlook.Repo.events
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
