defmodule Exlook.Event do
  use Exlook.Web, :model

  schema "events" do
    field :name, :string
    field :email, :string
  end
end

