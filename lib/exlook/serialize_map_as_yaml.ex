defmodule Exlook.SerializeMapAsYaml do
  def type, do: :yaml

  def load(raw_data) do
    data = YamlElixir.read_from_string(raw_data, atoms: true)
    {:ok, data}
  end
end
