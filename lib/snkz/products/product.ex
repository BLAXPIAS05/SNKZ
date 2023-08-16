defmodule Snkz.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snkz.InStock.InventoryStock


  schema "products" do
    field :title
    field :color, {:array, :string}
    field :size, {:array, :string}
    field :description
    has_many :in_stock, InventoryStock

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [])
    |> validate_required([])
  end
end
