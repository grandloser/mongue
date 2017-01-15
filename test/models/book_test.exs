defmodule Mongue.BookTest do
  use Mongue.ModelCase

  alias Mongue.Book

  @valid_attrs %{author: "some content", category: "some content", cover_l_url: "some content", cover_s_url: "some content", description: "some content", link: "some content", pub_nm: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end
end
