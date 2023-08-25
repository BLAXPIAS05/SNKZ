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
alias Snkz.Products.Image

#-----------------------------------------------------------

# brands = ~w[Nike Adidas Puma]
# models = ~w[Air Jordan Lebron]
# modifiers = ~w[Max Flyte Low]


images = %{"white" => "data:image/jpeg;base64,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",
           "red" => "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQfxz55XD10WCBXW4QB6eQK0XEQ3Exl_iRzB5d9H2gcI2nVv4H0Kdqs0-xtqMNix-C7OEfTYFc&usqp=CAc"
}
# for brand <- brands,
#     model <- models,
#     modifier <- modifiers do
#   product =
#     Repo.insert!(%Product{
#       title: "#{brand} #{model} #{modifier}",
#       description: "A cool shoe"
#     })

#   for {color, image} <- images do
#     Repo.insert!(%Image{
#       product_id: product.id,
#       image_url: image,
#       color: color
#     })
#   end
# end

#-----------------------------------------------------------

product =
  Repo.insert!(%Product{
    title: "Air Force 1",
    description: "The Nike Air Force 1 is a classic and iconic sneaker that has been a staple in the world of streetwear and sneaker culture since its debut in 1982. Designed by Bruce Kilgore, it was the first basketball shoe to feature Nike's Air cushioning technology in the sole, providing exceptional comfort and support on and off the court. The Air Force 1 is known for its clean and timeless design, featuring a low-top or high-top silhouette with a prominent swoosh logo on the sides. Over the years, it has been released in a wide array of colorways, collaborations, and special editions, making it a versatile choice for casual wear and a canvas for artistic expression within sneaker customization. Its enduring popularity has solidified its status as an enduring symbol of sneaker culture and urban fashion.",
    colors: ~w[white red]
  })

for {color, image} <- images do
  Repo.insert!(%Image{
    product_id: product.id,
    image_url: image,
    color: color
  })
end
