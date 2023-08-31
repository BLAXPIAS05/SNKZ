defmodule Snkz.ProductsTest do
  use Snkz.DataCase

  alias Snkz.Products

  describe "products" do
    alias Snkz.Products.Product

    import Snkz.ProductsFixtures

    @invalid_attrs %{}

    defp with_images(product) do
      Repo.preload(product, [:images])
    end

    defp preloaded(product) do
      Repo.preload(product, [:images, :in_stock])
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [with_images(product)]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == preloaded(product)
    end

    # test "create_product/1 with valid data creates a product" do
    #  valid_attrs = %{}
    #
    #   assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
    # end

    # test "create_product/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    # end

    # test "update_product/2 with valid data updates the product" do
    #   product = product_fixture()
    #   update_attrs = %{}

    #   assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
    # end

    # test "update_product/2 with invalid data returns error changeset" do
    #   product = product_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
    #   assert product == Products.get_product!(product.id)
    # end

    # test "delete_product/1 deletes the product" do
    #   product = product_fixture()
    #   assert {:ok, %Product{}} = Products.delete_product(product)
    #   assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    # end

    # test "change_product/1 returns a product changeset" do
    #   product = product_fixture()
    #   assert %Ecto.Changeset{} = Products.change_product(product)
    # end
  end
end
