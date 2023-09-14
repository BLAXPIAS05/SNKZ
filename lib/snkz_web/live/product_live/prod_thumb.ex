defmodule SnkzWeb.ProdThumb do
  use Phoenix.Component

  def thumbnail(%{thumb_url: url, main_url: url} = assigns) do
    ~H"""
    <img
      class="outline outline-zinc-500 rounded-lg"
      src={url}
    />
    """
  end

  def thumbnail(assigns) do
    ~H"""
    <img src={@thumb_url} />
    """
  end
end
