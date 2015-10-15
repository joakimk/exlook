# Exlook

Experimental reimplementation of <https://github.com/barsoom/gridlook> in elixir.

# todo:

- get a query working locally
- deploy to heroku and share database with the rails version
- get a query working in console on heroku
- basic index view
- pagination
- filtering

# Load data dump from gridlook

   heroku pg:backups capture -a gridlook
   curl --output /tmp/data.dump `heroku pg:backups public-url -a gridlook`
   mix ecto.create
   pg_restore --no-acl --no-owner -d exlook_dev /tmp/data.dump

# Commands used to deploy to heroku

    heroku apps:create exlook --region eu
    heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack
    heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir
    heroku config:set SECRET_KEY_BASE=$(elixir -e "IO.puts :crypto.strong_rand_bytes(64) |> Base.encode64")
    heroku config:set USER_TOKEN=$(elixir -e "IO.puts Regex.replace(~r/[^a-zA-Z0-9]/, (:crypto.strong_rand_bytes(64) |> Base.encode64), \"\")")
    # heroku addons:attach <gridlook-db> -a exlook
    git push heroku
