defmodule AutocompleteSearchWeb.PageLive do
  use AutocompleteSearchWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
