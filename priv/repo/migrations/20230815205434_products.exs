defmodule Snkz.Repo.Migrations.Products do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :size, {:array, :decimal}
      add :colors, {:array, :string}
      add :description, :text

      timestamps()
    end
  end
end
