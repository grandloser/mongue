defmodule Mongue.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :link, :string
      add :cover_s_url, :string
      add :cover_l_url, :string
      add :description, :string
      add :author, :string
      add :pub_nm, :string
      add :category, :string

      timestamps()
    end

  end
end
