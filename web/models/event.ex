defmodule Exlook.Event do
  use Exlook.Web, :model

  schema "events" do
    field :name, :string
    field :email, :string
    field :category, :string
    field :data, :string
    field :happened_at, Ecto.DateTime
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime
    field :unique_args, :string
    field :mailer_action, :string
  end
end

