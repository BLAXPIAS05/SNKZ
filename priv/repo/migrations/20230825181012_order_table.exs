defmodule Snkz.Repo.Migrations.OrderTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:user_id, references(:users, on_delete: :delete_all), null: false)

      timestamps()
    end

    create table(:order_items) do
      add(:in_stock_id, references(:in_stock, on_delete: :delete_all), null: false)
      add(:order_id, references(:orders, on_delete: :delete_all), null: false)

      timestamps()
    end
  end
end
