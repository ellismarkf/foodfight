defmodule FoodfightWeb.ErrorJSONTest do
  use FoodfightWeb.ConnCase, async: true

  test "renders 404" do
    assert FoodfightWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FoodfightWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
