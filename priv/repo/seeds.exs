alias Snkz.Repo
alias Snkz.Products.Product
alias Snkz.Products.InStock
alias Snkz.Products.Image
alias Snkz.Accounts

# ----------------------------USERS-------------------------------

{:ok, seller} = Accounts.register_user(%{email: "seller@mail.com", password: "password1234"})

{:ok, _buyer} = Accounts.register_user(%{email: "buyer@mail.com", password: "password1234"})

# ----------------------------AIR FORCE 1-------------------------------

af1_images = %{
"white" =>
  "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/white.jpg",
"red" =>
  "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/red.jpg",
"black" =>
  "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/black.jpg"
}

air_force_1 =
Repo.insert!(%Product{
  title: "Air Force 1",
  description:
    "The Nike Air Force 1 is a classic and iconic sneaker that has been a staple in the world of streetwear and sneaker culture since its debut in 1982. Designed by Bruce Kilgore, it was the first basketball shoe to feature Nike's Air cushioning technology in the sole, providing exceptional comfort and support on and off the court. The Air Force 1 is known for its clean and timeless design, featuring a low-top or high-top silhouette with a prominent swoosh logo on the sides. Over the years, it has been released in a wide array of colorways, collaborations, and special editions, making it a versatile choice for casual wear and a canvas for artistic expression within sneaker customization. Its enduring popularity has solidified its status as an enduring symbol of sneaker culture and urban fashion.",
  colors: ~w[white red black]
})

_images =
for {color, af1_image} <- af1_images do
  Repo.insert!(%Image{
    product_id: air_force_1.id,
    image_url: af1_image,
    color: color
  })
end

_in_stock1 =
Repo.insert!(%InStock{
  color: "white",
  size: "8",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

_in_stock6 =
Repo.insert!(%InStock{
  color: "white",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

_in_stock2 =
Repo.insert!(%InStock{
  color: "white",
  size: "12",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

_in_stock3 =
Repo.insert!(%InStock{
  color: "red",
  size: "12",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

_in_stock4 =
Repo.insert!(%InStock{
  color: "red",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

_in_stock5 =
Repo.insert!(%InStock{
  color: "red",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: air_force_1.id
})

# ----------------------------JORDAN 1-------------------------------

j1_images = %{
  "white" =>
    "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/white.jpg",
  "red" =>
    "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/red.jpg",
  "black" =>
    "https://gist.github.com/rubysolo/f9f746e69e88ef80383b8e94c02e886d/raw/1fcb6376b26778948a6da2425724cf8fe366eae2/black.jpg"
}

jordan_1 =
Repo.insert!(%Product{
  title: "Jordan 1",
  description:
    "The Jordan 1s, born in 1985 as the inaugural signature shoe of NBA legend Michael Jordan, are an iconic blend of athletic performance and timeless style. Characterized by a high-top silhouette, leather upper, bold Swoosh logo, and Air-Sole cushioning, they offer both comfort and fashion versatility. With a vast range of colorways and collaborations, these sneakers hold a special place in sneaker culture and fashion, transcending their basketball roots to become a symbol of enduring style and cultural significance, adored by sneakerheads, collectors, athletes, and fashion enthusiasts alike.",
  colors: ~w[white red black]
})

_images =
for {color, j1_image} <- j1_images do
  Repo.insert!(%Image{
    product_id: jordan_1.id,
    color: color
  })
end

_in_stock1 =
Repo.insert!(%InStock{
  color: "white",
  size: "8",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

_in_stock6 =
Repo.insert!(%InStock{
  color: "white",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

_in_stock2 =
Repo.insert!(%InStock{
  color: "white",
  size: "12",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

_in_stock3 =
Repo.insert!(%InStock{
  color: "red",
  size: "12",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

_in_stock4 =
Repo.insert!(%InStock{
  color: "red",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

_in_stock5 =
Repo.insert!(%InStock{
  color: "red",
  size: "10",
  price: 100,
  user_id: seller.id,
  product_id: jordan_1.id
})

# ----------------------------SEED DESCRIPTION-------------------------------

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
