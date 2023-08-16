defmodule SnkzWeb.InventoryStockLive.Show do
  use SnkzWeb, :live_view

  alias Snkz.InStock

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:inventory_stock, InStock.get_inventory_stock!(id))}
  end

  defp page_title(:show), do: "Show Inventory stock"
  defp page_title(:edit), do: "Edit Inventory stock"
end
