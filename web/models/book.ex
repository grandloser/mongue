defmodule Mongue.Book do
  use Mongue.Web, :model
  @derive [Poison.Encoder]
  
  schema "books" do
    field :title, :string
    field :link, :string
    field :cover_s_url, :string
    field :cover_l_url, :string
    field :description, :string
    field :author, :string
    field :pub_nm, :string
    field :category, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :link, :cover_s_url, :cover_l_url, :description, :author, :pub_nm, :category])
    # |> validate_required([:title, :link, :cover_s_url, :cover_l_url, :description, :author, :pub_nm, :category])
  end
end
