defmodule Snkz.Inventory do
  @moduledoc """
  The InStock context.
  """

  import Ecto.Query, warn: false
  alias Snkz.Repo

  alias Snkz.Products.InStock

  @doc """
  Returns the list of in_stock.

  ## Examples

      iex> list_in_stock()
      [%InStock{}, ...]

  """
  def list_in_stock do
    Repo.all(InStock)
  end

  @doc """
  Gets a single inventory_stock.

  Raises `Ecto.NoResultsError` if the Inventory stock does not exist.

  ## Examples

      iex> get_inventory_stock!(123)
      %InStock{}

      iex> get_inventory_stock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory_stock!(id), do: Repo.get!(InventoryStock, id)

  @doc """
  Creates a inventory_stock.

  ## Examples

      iex> create_inventory_stock(%{field: value})
      {:ok, %InStock{}}

      iex> create_inventory_stock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory_stock(attrs \\ %{}) do
    %InStock{}
    |> InStock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory_stock.

  ## Examples

      iex> update_inventory_stock(inventory_stock, %{field: new_value})
      {:ok, %InStock{}}

      iex> update_inventory_stock(inventory_stock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory_stock(%InStock{} = inventory_stock, attrs) do
    inventory_stock
    |> InStock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inventory_stock.

  ## Examples

      iex> delete_inventory_stock(inventory_stock)
      {:ok, %InStock{}}

      iex> delete_inventory_stock(inventory_stock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory_stock(%InStock{} = inventory_stock) do
    Repo.delete(inventory_stock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory_stock changes.

  ## Examples

      iex> change_inventory_stock(inventory_stock)
      %Ecto.Changeset{data: %InStock{}}

  """
  def change_inventory_stock(%InStock{} = inventory_stock, attrs \\ %{}) do
    InStock.changeset(inventory_stock, attrs)
  end
end
