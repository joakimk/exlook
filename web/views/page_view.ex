defmodule Exlook.PageView do
  use Exlook.Web, :view

  def identicon(event) do
    if smtp_id(event) do
      ~E{
        <img alt="" src="//www.gravatar.com/avatar/<%= Base.encode16(:erlang.md5(smtp_id(event)), case: :lower) %>?s=40&r=any&default=identicon&forcedefault=1" />
      }
    else
      ""
    end
  end

  def data_if_present(data) when map_size(data) == 0, do: ""
  def data_if_present(data), do: inspect_value(data)

  defp inspect_value(map) when is_map(map) do
    map
    |> Enum.map(fn ({key, value}) ->
      ~E{
        <p><%= key %> = <%= inspect_value(value) %></p>
      }
    end)
  end

  defp inspect_value(value) when is_list(value), do: inspect(value)
  defp inspect_value(value), do: value

  defp smtp_id(event), do: event.data[:"smtp-id"]
end
