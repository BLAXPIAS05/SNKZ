defmodule SnkzWeb.ProductLive.BuyComponent do
  use SnkzWeb, :live_component

  alias Snkz.Inventory

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        Confirm Purchase
      </.header>



      <.simple_form
        for={@form}
        id="sell-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

      <.input field={@form[:user_id]} type="hidden" />
      <.input field={@form[:product_id]} type="hidden" />
      <:actions>
      <%!-- <.link patch={~p""}> --%>
        <.button phx-disable-with="Buying...">Buy Product</.button>
      <%!-- </.link> --%>
      </:actions>
    </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{in_stock: in_stock} = assigns, socket) do
    changeset = Inventory.change_inventory_stock(in_stock)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"inventory_stock" => in_stock_params}, socket) do
    params =
      in_stock_params |> Map.merge(%{"user_id" => socket.assigns.current_user.id, "product_id" => socket.assigns.id})
    changeset =
      socket.assigns.in_stock
      |> Inventory.change_inventory_stock(params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"inventory_stock" => in_stock_params}, socket) do
    params =
      in_stock_params |> Map.merge(%{"user_id" => socket.assigns.current_user.id, "product_id" => socket.assigns.id})

    case Inventory.create_inventory_stock(params) do
      {:ok, in_stock} ->
        notify_parent({:saved, in_stock})

        {:noreply,
         socket
         |> put_flash(:info, "Thanks for listing your shoes")
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
