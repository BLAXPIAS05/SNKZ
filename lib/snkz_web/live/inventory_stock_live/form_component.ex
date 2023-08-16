defmodule SnkzWeb.InventoryStockLive.FormComponent do
  use SnkzWeb, :live_component

  alias Snkz.InStock

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage inventory_stock records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="inventory_stock-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Inventory stock</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{inventory_stock: inventory_stock} = assigns, socket) do
    changeset = InStock.change_inventory_stock(inventory_stock)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"inventory_stock" => inventory_stock_params}, socket) do
    changeset =
      socket.assigns.inventory_stock
      |> InStock.change_inventory_stock(inventory_stock_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"inventory_stock" => inventory_stock_params}, socket) do
    save_inventory_stock(socket, socket.assigns.action, inventory_stock_params)
  end

  defp save_inventory_stock(socket, :edit, inventory_stock_params) do
    case InStock.update_inventory_stock(socket.assigns.inventory_stock, inventory_stock_params) do
      {:ok, inventory_stock} ->
        notify_parent({:saved, inventory_stock})

        {:noreply,
         socket
         |> put_flash(:info, "Inventory stock updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_inventory_stock(socket, :new, inventory_stock_params) do
    case InStock.create_inventory_stock(inventory_stock_params) do
      {:ok, inventory_stock} ->
        notify_parent({:saved, inventory_stock})

        {:noreply,
         socket
         |> put_flash(:info, "Inventory stock created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
