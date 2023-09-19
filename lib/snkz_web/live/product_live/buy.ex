defmodule SnkzWeb.ProductLive.Buy do
  use SnkzWeb, :live_view

  alias Gringotts.Gateways.Monei
  alias Gringotts.CreditCard

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
  def handle_params(_params, _, socket) do
    form = to_form(@empty_card)

    {:noreply,
     socket
     |> assign(:message, "ready")
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

    amount = Money.new(42, :EUR)

    message =
      case Gringotts.purchase(Monei, amount, card, order_id: "TEST1234") do
        {:ok, %{id: id}} ->
          "Payment authorized, reference token: '#{id}'"

        {:error, %{status_code: error, raw: raw_response}} ->
          "Error: #{error}\nRaw:\n#{raw_response}"

        %{"error" => %{"message" => message}} ->
          message
      end

    {:noreply,
     socket
     |> assign(:message, message)}
  end
end
