defmodule Snkz.Products.Image do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snkz.Products.Product

  schema "images" do
    field :image_url, :string
    field :color, :string
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image_url, :color, :product_id])
    |> validate_required([:image_url, :color, :product_id])
  end
end
