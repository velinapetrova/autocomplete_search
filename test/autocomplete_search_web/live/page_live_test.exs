defmodule AutocompleteSearchWeb.PageLiveTest do
  use AutocompleteSearchWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Search Component"
    assert render(page_live) =~ "Search Component"
  end
end
