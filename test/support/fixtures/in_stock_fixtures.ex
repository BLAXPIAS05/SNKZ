defmodule Snkz.InStockFixtures do
  alias Snkz.AccountsFixtures
  alias Snkz.ProductsFixtures

  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.Inventory` context.
  """

  @doc """
  Generate a inventory_stock.
  """
  def inventory_stock_fixture(attrs \\ %{}) do
    user = AccountsFixtures.user_fixture()
    product = ProductsFixtures.product_fixture()

    {:ok, inventory_stock} =
      attrs
      |> Enum.into(%{
        color: "red",
        size: "10",
        price: "100",
        user_id: user.id,
        product_id: product.id
      })
      |> Snkz.Inventory.create_inventory_stock()

    inventory_stock
  end
end
