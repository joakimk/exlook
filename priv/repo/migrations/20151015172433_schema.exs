defmodule Exlook.Repo.Migrations.Schema do
  use Ecto.Migration

  def up do
    if Mix.env != :test do
      raise "As long as we share db in prod with the rails app, don't accidentally run any migrations"
    end

     create table(:events) do
       add :email, :string
       add :name, :string
       add :category, :text
       add :data, :text
       add :happened_at, :datetime
       add :created_at, :datetime
       add :updated_at, :datetime
       add :unique_args, :text
       add :mailer_action, :string
     end

     create index(:events, [:email])
     create index(:events, [:happened_at, :id])
     create index(:events, [:mailer_action, :happened_at, :id])
     create index(:events, [:name])

     create table(:events_data) do
       add :total_events, :integer
     end
  end

  def down do
    raise "There is no down :)"
  end
end
