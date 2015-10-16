defmodule Exlook.Event do
  use Exlook.Web, :model

  schema "events" do
    field :name, :string
    field :email, :string
    field :category, :string
    field :data, Exlook.SerializeMapAsYaml
    field :happened_at, Ecto.DateTime
    field :created_at, Ecto.DateTime
    field :updated_at, Ecto.DateTime
    field :unique_args, Exlook.SerializeMapAsYaml
    field :mailer_action, :string
  end
end

