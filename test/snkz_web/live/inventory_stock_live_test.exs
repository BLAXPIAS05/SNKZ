defmodule SnkzWeb.InventoryStockLiveTest do
  use SnkzWeb.ConnCase

  import Phoenix.LiveViewTest
  import Snkz.InStockFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_inventory_stock(_) do
    inventory_stock = inventory_stock_fixture()
    %{inventory_stock: inventory_stock}
  end

  describe "Index" do
    setup [:create_inventory_stock]

    test "lists all in_stock", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/in_stock")

      assert html =~ "Listing In stock"
    end

    test "saves new inventory_stock", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/in_stock")

      assert index_live |> element("a", "New Inventory stock") |> render_click() =~
               "New Inventory stock"

      assert_patch(index_live, ~p"/in_stock/new")

      assert index_live
             |> form("#inventory_stock-form", inventory_stock: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#inventory_stock-form", inventory_stock: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/in_stock")

      html = render(index_live)
      assert html =~ "Inventory stock created successfully"
    end

    test "updates inventory_stock in listing", %{conn: conn, inventory_stock: inventory_stock} do
      {:ok, index_live, _html} = live(conn, ~p"/in_stock")

      assert index_live |> element("#in_stock-#{inventory_stock.id} a", "Edit") |> render_click() =~
               "Edit Inventory stock"

      assert_patch(index_live, ~p"/in_stock/#{inventory_stock}/edit")

      assert index_live
             |> form("#inventory_stock-form", inventory_stock: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#inventory_stock-form", inventory_stock: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/in_stock")

      html = render(index_live)
      assert html =~ "Inventory stock updated successfully"
    end

    test "deletes inventory_stock in listing", %{conn: conn, inventory_stock: inventory_stock} do
      {:ok, index_live, _html} = live(conn, ~p"/in_stock")

      assert index_live |> element("#in_stock-#{inventory_stock.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#in_stock-#{inventory_stock.id}")
    end
  end

  describe "Show" do
    setup [:create_inventory_stock]

    test "displays inventory_stock", %{conn: conn, inventory_stock: inventory_stock} do
      {:ok, _show_live, html} = live(conn, ~p"/in_stock/#{inventory_stock}")

      assert html =~ "Show Inventory stock"
    end

    test "updates inventory_stock within modal", %{conn: conn, inventory_stock: inventory_stock} do
      {:ok, show_live, _html} = live(conn, ~p"/in_stock/#{inventory_stock}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Inventory stock"

      assert_patch(show_live, ~p"/in_stock/#{inventory_stock}/show/edit")

      assert show_live
             |> form("#inventory_stock-form", inventory_stock: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#inventory_stock-form", inventory_stock: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/in_stock/#{inventory_stock}")

      html = render(show_live)
      assert html =~ "Inventory stock updated successfully"
    end
  end
end
