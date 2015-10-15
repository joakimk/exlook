# Exlook

Experimental reimplementation of <https://github.com/barsoom/gridlook> in elixir.

# todo:

- [x] get a query working locally
- [x] deploy to heroku and share database with the rails version
- [x] get a query working in console on heroku
- [x] map schema for the entire model
- [x] authorization
- [x] partial index view
- [ ] complete index view
- [ ] pagination
- [ ] filtering
- [ ] demo/evaluate/compare
- [ ] change to separate database and start receiving events to this app too
- [ ] docs, etc.

# Set up a development server using production data

```
mix deps.get
mix ecto.create

heroku pg:backups capture -a gridlook_app
curl --output /tmp/data.dump `heroku pg:backups public-url -a gridlook_app`
pg_restore --no-acl --no-owner -d app_name_dev /tmp/data.dump

mix phoenix.server
open "http://localhost:4000/?token=secret"
```

# Test

```
MIX_ENV=test mix ecto.migrate
mix test
```

# Commands used to deploy to heroku

    heroku apps:create app_name --region eu
    heroku buildpacks:set https://github.com/gjaldon/phoenix-static-buildpack
    heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir
    heroku config:set SECRET_KEY_BASE=$(elixir -e "IO.puts :crypto.strong_rand_bytes(64) |> Base.encode64")
    heroku config:set USER_TOKEN=$(elixir -e "IO.puts Regex.replace(~r/[^a-zA-Z0-9]/, (:crypto.strong_rand_bytes(64) |> Base.encode64), \"\")")
    # heroku addons:attach <gridlook-db> -a app_name
    git push heroku
