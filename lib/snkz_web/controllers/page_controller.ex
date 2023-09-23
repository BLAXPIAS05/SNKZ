defmodule SnkzWeb.PageController do
  use SnkzWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false, background_color: "bg-[#b4d6e3]")
  end
end
