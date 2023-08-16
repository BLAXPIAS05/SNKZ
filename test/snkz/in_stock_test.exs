defmodule Snkz.InStockTest do
  use Snkz.DataCase

  alias Snkz.InStock

  describe "in_stock" do
    alias Snkz.InStock.InventoryStock

    import Snkz.InStockFixtures

    @invalid_attrs %{}

    test "list_in_stock/0 returns all in_stock" do
      inventory_stock = inventory_stock_fixture()
      assert InStock.list_in_stock() == [inventory_stock]
    end

    test "get_inventory_stock!/1 returns the inventory_stock with given id" do
      inventory_stock = inventory_stock_fixture()
      assert InStock.get_inventory_stock!(inventory_stock.id) == inventory_stock
    end

    test "create_inventory_stock/1 with valid data creates a inventory_stock" do
      valid_attrs = %{}

      assert {:ok, %InventoryStock{} = inventory_stock} = InStock.create_inventory_stock(valid_attrs)
    end

    test "create_inventory_stock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = InStock.create_inventory_stock(@invalid_attrs)
    end

    test "update_inventory_stock/2 with valid data updates the inventory_stock" do
      inventory_stock = inventory_stock_fixture()
      update_attrs = %{}

      assert {:ok, %InventoryStock{} = inventory_stock} = InStock.update_inventory_stock(inventory_stock, update_attrs)
    end

    test "update_inventory_stock/2 with invalid data returns error changeset" do
      inventory_stock = inventory_stock_fixture()
      assert {:error, %Ecto.Changeset{}} = InStock.update_inventory_stock(inventory_stock, @invalid_attrs)
      assert inventory_stock == InStock.get_inventory_stock!(inventory_stock.id)
    end

    test "delete_inventory_stock/1 deletes the inventory_stock" do
      inventory_stock = inventory_stock_fixture()
      assert {:ok, %InventoryStock{}} = InStock.delete_inventory_stock(inventory_stock)
      assert_raise Ecto.NoResultsError, fn -> InStock.get_inventory_stock!(inventory_stock.id) end
    end

    test "change_inventory_stock/1 returns a inventory_stock changeset" do
      inventory_stock = inventory_stock_fixture()
      assert %Ecto.Changeset{} = InStock.change_inventory_stock(inventory_stock)
    end
  end
end
