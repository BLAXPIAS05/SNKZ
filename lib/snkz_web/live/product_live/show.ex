defmodule SnkzWeb.ProductLive.Show do
  use SnkzWeb, :live_view

  alias Snkz.Products

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    product = Products.get_product!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, product)
     |> assign(:current_image, List.first(product.images))}
  end

  def handle_event("select image", %{"id" => id}, %{assigns: %{product: product}} = socket) do
    image = Enum.find(product.images, fn i -> to_string(i.id) == id end)
    {:noreply, socket |> assign(current_image: image)}
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:sell), do: "Sell Product"
  defp page_title(:edit), do: "Edit Product"
end
