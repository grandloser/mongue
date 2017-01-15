defmodule Mongue.SearchView do
  use Mongue.Web, :view

  def is_item_nil?("" = item), do: true
  def is_item_nil?(item), do: false
  def replace_tag(str) do
    str
    |>  String.replace("<b>", "<font style='color:orange'%>")
    |>  String.replace("</b>", "</font>")

  end
end
