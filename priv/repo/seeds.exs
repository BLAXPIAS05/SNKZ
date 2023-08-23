# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Snkz.Repo.insert!(%Snkz.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Snkz.Repo
alias Snkz.Products.Product

brands = ~w[Nike Adidas Puma]
models = ~w[Air Jordan Lebron]
modifiers = ~w[Max Flyte Low]

for brand <- brands,
    model <- models,
    modifier <- modifiers do
  Repo.insert!(%Product{
    title: "#{brand} #{model} #{modifier}",
    description: "A cool shoe"
  })
end
