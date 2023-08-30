defmodule Snkz.InStockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.InStock` context.
  """

  @doc """
  Generate a inventory_stock.
  """
  alias Snkz.{AccountsFixtures, ProductsFixtures}

  @colors ~w(white red blue green)
  @sizes ~w(7 7.5 8 8.5 9 9.5 10 10.5 11 11.5 12 12.5 13 13.5 14 14.5 15)

  def inventory_stock_fixture(attrs \\ %{}) do
    product = ProductsFixtures.product_fixture()
    user = AccountsFixtures.user_fixture()

    {:ok, inventory_stock} =
      attrs
      |> Enum.into(%{
        color: Enum.random(@colors),
        size: Enum.random(@sizes),
        price: Enum.random(70..250),
        product_id: product.id,
        user_id: user.id
      })
      |> Snkz.InStock.create_inventory_stock()

    inventory_stock
  end
end
