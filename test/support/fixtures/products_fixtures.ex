defmodule Snkz.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        title: "test product",
        description: "test description",
        colors: ["red", "green", "blue"]
      })
      |> Snkz.Products.create_product()

    product
  end
end
