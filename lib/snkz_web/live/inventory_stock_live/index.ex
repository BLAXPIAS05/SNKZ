defmodule SnkzWeb.InventoryStockLive.Index do
  use SnkzWeb, :live_view

  alias Snkz.InStock
  alias Snkz.InStock.InventoryStock

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :in_stock, InStock.list_in_stock())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Inventory stock")
    |> assign(:inventory_stock, InStock.get_inventory_stock!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Inventory stock")
    |> assign(:inventory_stock, %InventoryStock{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing In stock")
    |> assign(:inventory_stock, nil)
  end

  @impl true
  def handle_info({SnkzWeb.InventoryStockLive.FormComponent, {:saved, inventory_stock}}, socket) do
    {:noreply, stream_insert(socket, :in_stock, inventory_stock)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    inventory_stock = InStock.get_inventory_stock!(id)
    {:ok, _} = InStock.delete_inventory_stock(inventory_stock)

    {:noreply, stream_delete(socket, :in_stock, inventory_stock)}
  end
end
