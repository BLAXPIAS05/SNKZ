defmodule SnkzWeb.ProductLive.Buy do
  use SnkzWeb, :live_view

  alias Gringotts.Gateways.Monei
  alias Gringotts.CreditCard
  alias Snkz.Inventory

  @empty_card %{
    "verification_code" => "123",
    "first_name" => "Harry",
    "last_name" => "Potter",
    "number" => "4444444444444414",
    "month" => 12,
    "brand" => "VISA",
    "year" => 34
  }

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _, socket) do
    form = to_form(@empty_card)

    stock_id = Map.get(params, "stock_id")

    in_stock = Inventory.get_inventory_stock!(stock_id)

    {:noreply,
     socket
     |> assign(:in_stock, in_stock)
     |> assign(:message, "")
     |> assign(:form, form)}
  end

  @impl true
  def handle_event("validate", params, socket) do
    form = to_form(params)

    {:noreply,
     socket
     |> assign(:form, form)}
  end

  @impl true
  def handle_event("save", params, socket) do
    card = %CreditCard{
      first_name: Map.get(params, "first_name"),
      last_name: Map.get(params, "last_name"),
      number: Map.get(params, "number"),
      year: String.to_integer(Map.get(params, "year")),
      month: String.to_integer(Map.get(params, "month")),
      verification_code: Map.get(params, "verification_code"),
      brand: Map.get(params, "brand")
    }

    in_stock = socket.assigns.in_stock

    amount = Money.new(in_stock.price, :EUR)

    time = DateTime.utc_now()

    {microsecond, _} = time.microsecond

    order_id = "#{time.year}" <> "#{time.month}" <> "#{time.day}" <> "#{time.hour}" <> "#{time.minute}" <>"#{time.second}" <> "#{microsecond}"

    case Gringotts.purchase(Monei, amount, card, order_id: order_id) do
      {:ok, %{id: id}} ->
        "Payment authorized, reference token: '#{id}'"

        {:noreply,
          socket
          |> put_flash(:info, "Thanks for your purchase. Your order id is:  #{order_id}")
          |> push_navigate(to: ~p"/products/#{in_stock.product_id}")}

      {:error, %{status_code: error}} ->

        {:noreply,
          socket
          |> assign(:message, "Error: #{error}")}

      %{"error" => %{"message" => message}} ->

        {:noreply,
          socket
          |> assign(:message, message)}
    end
  end
end
