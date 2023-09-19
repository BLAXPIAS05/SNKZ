defmodule SnkzWeb.Notifier do
  use Phoenix.Component

  def notifier(assigns) do
    ~H"""
    <div
      :if={@notifier && (@notifier.color == @image.color) && (@action != :end)}
      class="absolute w-2 h-2 bg-red-600 rounded-full -top-1 -right-1"
    >
    </div>
    """
  end
end
