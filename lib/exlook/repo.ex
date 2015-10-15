defmodule Exlook.Repo do
  use Ecto.Repo, otp_app: :exlook
  import Ecto.Query

  def events do
    all from _ in Exlook.Event,
      limit: 100
  end
end
