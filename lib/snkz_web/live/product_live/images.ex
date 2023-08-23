defmodule SnkzWeb.ProductLive.Images do
  use SnkzWeb, :live_view

  alias Snkz.Products

  def render(assigns) do
    ~H"""
    
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply, stream(socket, :images, Products.list_images(id))}
  end
end
