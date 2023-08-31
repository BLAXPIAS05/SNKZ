defmodule Snkz.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Snkz.Products` context.
  """

  @doc """
  Generate a product.
  """
  @colors ~w(white red blue green)

  alias Snkz.Products.Image
  alias Snkz.Repo

  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        title: "test product",
        description: "test description",
        colors: @colors
      })
      |> Snkz.Products.create_product()

    product
  end

  def image_fixture(product, attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        product_id: product.id,
        image_url: "http://some/img.jpg",
        color: Enum.random(@colors)
      })
      |> then(&Image.changeset(%Image{}, &1))
      |> Repo.insert()

    image
  end
end
