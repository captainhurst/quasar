defmodule Quasar.Wiki.Tag do
  use Quasar.Web, :model

  schema "tags" do
    field :name, :string
    many_to_many :pages, Quasar.Wiki.Page, join_through: "pages_tags", on_delete: :delete_all
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
