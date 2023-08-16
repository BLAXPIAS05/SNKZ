defmodule Snkz.InStockFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.InStock` context.
  """

  @doc """
  Generate a inventory_stock.
  """
  def inventory_stock_fixture(attrs \\ %{}) do
    {:ok, inventory_stock} =
      attrs
      |> Enum.into(%{

      })
      |> Snkz.InStock.create_inventory_stock()

    inventory_stock
  end
end
