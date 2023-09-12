defmodule SnkzWeb.Size do
  use Phoenix.Component

  attr :opts, :list, required: true

  def select_size(%{opts: []} = assigns) do
    ~H"""
    <div>Color Unavailable</div>
    """
  end

  def select_size(assigns) do
    ~H"""
    <form phx-change="select size">
      <select
        name="size"
        class="mt-2 block w-full rounded-md border border-gray-300 bg-white shadow-sm focus:border-zinc-400 focus:ring-0 sm:text-sm"
      >
        <option value="">Size</option>
        <%= Phoenix.HTML.Form.options_for_select(@opts, "") %>
      </select>
    </form>
    """
  end

  def available_sizes(product, image) do
    product.in_stock
    |> Enum.filter(fn i -> i.color == image.color end)
    |> Enum.map(fn i -> i.size end)
    |> Enum.uniq()
  end
end
