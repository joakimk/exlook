defmodule Exlook.PageView do
  use Exlook.Web, :view

  def data_if_present(data, title \\ nil) do
    ~E{
      <%= inspect(data) %>
      <br/><br/>
    }
    #(title ? content_tag(:h4, title) : "".html_safe) + inspect_value(data)
  end
end
