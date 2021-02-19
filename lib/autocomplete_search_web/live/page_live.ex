defmodule AutocompleteSearchWeb.PageLive do
  use AutocompleteSearchWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:selected_items, [])
      |> assign(:available_items, [])

    {:ok, socket}
  end

  @impl true
  def handle_event("search", %{"value" => ""}, socket) do
    {:noreply, assign(socket, :available_items, [])}
  end

  @impl true
  def handle_event("search", %{"value" => value}, socket) do
    items = list_items() -- socket.assigns.selected_items

    available_items = Enum.filter(items, &(String.downcase(&1) =~ String.downcase(value)))

    {:noreply, assign(socket, :available_items, available_items)}
  end

  @impl true
  def handle_event("deselect-item", %{"item" => item}, socket) do
    socket =
      socket
      |> assign(:selected_items, socket.assigns.selected_items -- [item])
      |> assign(:available_items, socket.assigns.available_items ++ [item])

    {:noreply, socket}
  end

  @impl true
  def handle_info({:item_selected, item}, socket) do
    socket =
      socket
      |> assign(:selected_items, socket.assigns.selected_items ++ [item])
      |> assign(:available_items, socket.assigns.available_items -- [item])

    {:noreply, socket}
  end

  defp list_items do
    [
      "Item A1", "Item A2", "Item A3",
      "Item B1", "Item B2", "Item B3",
      "Item C1", "Item C2", "Item C3",
      "Item D1", "Item D2", "Item D3",
      "Item E1", "Item E2", "Item E3",
      "Item F1", "Item F2", "Item F3",
    ]
  end
end
