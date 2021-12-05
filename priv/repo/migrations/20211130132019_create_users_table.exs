defmodule MyApi.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :password, :string
    end
  end
end
