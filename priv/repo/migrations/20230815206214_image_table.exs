defmodule Snkz.Repo.Migrations.CreateImagesTable do
  use Ecto.Migration

  def change do
    create table(:images) do
      add(:image_url, :text)
      add(:color, :string)
      add(:product_id, references(:products, on_delete: :delete_all), null: false)

      timestamps()
    end
  end
end
