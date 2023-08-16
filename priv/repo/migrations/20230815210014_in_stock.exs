defmodule Snkz.Repo.Migrations.InStock do
  use Ecto.Migration

  def change do
    create table(:in_stock) do
      add :size, :string
      add :color, :string
      add :price, :decimal
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :product_id, references(:products, on_delete: :delete_all), null: false
      timestamps()
    end
  end
end
