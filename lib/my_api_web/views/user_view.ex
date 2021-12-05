defmodule MyApiWeb.UserView do
  use MyApiWeb, :view

  def render("index.json", %{users: users}) do
    %{user: render_many(users, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      age: user.age,
      email: user.email
    }
  end
end
