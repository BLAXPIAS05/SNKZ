defmodule Snkz.Repo.Migrations.Products do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :color, {:array, :string}
      add :size, {:array, :decimal}
      add :description, :text
      timestamps()
    end
  end
end
