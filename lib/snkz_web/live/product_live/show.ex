defmodule SnkzWeb.ProductLive.Show do
  use SnkzWeb, :live_view

  alias Snkz.Products
  alias Snkz.InStock

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id} = params, _, socket) do
    product = Products.get_product!(id)

    in_stock =
      case Map.get(params, "stock_id") do
        nil -> nil
        id -> Enum.find(product.in_stock, fn i -> to_string(i.id) == id end)
      end

    current_image =
      case in_stock do
        nil -> List.first(product.images)
        %{color: color} -> Enum.find(product.images, fn i -> i.color == color end)
      end

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, product)
     |> assign(:in_stock, in_stock)
     |> assign(:current_image, current_image)
    }
  end

  def available_sizes(product, image) do
    product.in_stock
    |> Enum.filter(fn i -> i.color == image.color end)
    |> Enum.map(fn i -> i.size end)
    |> Enum.uniq()
  end

  @impl true
  def handle_event("select image", %{"id" => id}, %{assigns: %{product: product}} = socket) do
    image = Enum.find(product.images, fn i ->
      to_string(i.id) == id
    end)

    {:noreply,
     socket
     |> assign(:current_image, image)
     |> assign(:in_stock, nil)
    }
  end

  @impl true
  def handle_event("select size", %{"size" => size}, %{assigns: %{product: product, current_image: current_image}} = socket) do
    in_stock = Enum.find(product.in_stock, fn i ->
      to_string(i.size) == size && current_image.color == i.color
    end)

    {:noreply,
     socket
     |> assign(:in_stock, in_stock)
    }
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:sell), do: "Sell Product"
  # defp page_title(:edit), do: "Edit Product"
  defp page_title(:buy), do: "Buy Product"
end
