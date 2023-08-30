defmodule Snkz.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.Products` context.
  """

  @doc """
  Generate a product.
  """
  @colors ~w(white red blue green)

  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        title: "A Test Product",
        description: "Produces the finest tests ever",
        colors: @colors
      })
      |> Snkz.Products.create_product()

    product
  end
end
