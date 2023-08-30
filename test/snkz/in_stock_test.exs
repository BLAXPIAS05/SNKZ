defmodule Snkz.InventoryTest do
  use Snkz.DataCase

  alias Snkz.Inventory

  describe "in_stock" do
    alias Snkz.Products.InStock

    import Snkz.InStockFixtures
    import Snkz.ProductsFixtures
    import Snkz.AccountsFixtures

    @invalid_attrs %{color: "", size: "", price: "", user_id: "", product_id: ""}

    test "list_in_stock/0 returns all in_stock" do
      inventory_stock = inventory_stock_fixture()
      assert Inventory.list_in_stock() == [inventory_stock]
    end

    test "get_inventory_stock!/1 returns the inventory_stock with given id" do
      inventory_stock = inventory_stock_fixture()
      assert Inventory.get_inventory_stock!(inventory_stock.id) == inventory_stock
    end

    test "create_inventory_stock/1 with valid data creates a inventory_stock" do
      user = user_fixture()
      product = product_fixture()

      valid_attrs = %{color: "red", size: "10", price: "100", user_id: user.id, product_id: product.id}

      assert {:ok, %InStock{} = inventory_stock} = Inventory.create_inventory_stock(valid_attrs)
    end

    test "create_inventory_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_inventory_stock(@invalid_attrs)
    end

    test "update_inventory_stock/2 with valid data updates the inventory_stock" do
      inventory_stock = inventory_stock_fixture()
      update_attrs = %{}

      assert {:ok, %InStock{} = inventory_stock} =
               Inventory.update_inventory_stock(inventory_stock, update_attrs)
    end

    test "update_inventory_stock/2 with invalid data returns error changeset" do
      inventory_stock = inventory_stock_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Inventory.update_inventory_stock(inventory_stock, @invalid_attrs)

      assert inventory_stock == Inventory.get_inventory_stock!(inventory_stock.id)
    end

    test "delete_inventory_stock/1 deletes the inventory_stock" do
      inventory_stock = inventory_stock_fixture()
      assert {:ok, %InStock{}} = Inventory.delete_inventory_stock(inventory_stock)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_inventory_stock!(inventory_stock.id) end
    end

    test "change_inventory_stock/1 returns a inventory_stock changeset" do
      inventory_stock = inventory_stock_fixture()
      assert %Ecto.Changeset{} = Inventory.change_inventory_stock(inventory_stock)
    end
  end
end
