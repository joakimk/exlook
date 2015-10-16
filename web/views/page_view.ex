defmodule Exlook.PageView do
  use Exlook.Web, :view

  def data_if_present(data) when map_size(data) == 0, do: ""

  def data_if_present(data) do
    inspect_value(data)
  end

  defp inspect_value(map) when is_map(map) do
    map
    |> Enum.map(fn ({key, value}) ->
      ~E{
        <p><%= key %> = <%= inspect_value(value) %></p>
      }
    end)
  end

  defp inspect_value(value) when is_list(value) do
    inspect(value)
  end

  defp inspect_value(value), do: value
end
