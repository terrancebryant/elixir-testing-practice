defmodule Testing.BotControllerTest do
  use Testing.ConnCase, async: true

  alias Testing.{Repo, Bot}

  test "index/2 responds with all Bots" do
    bots = [ Bot.changeset(%Bot{}, %{name: "John", email: "john@example.com"}),
             Bot.changeset(%Bot{}, %{name: "Jane", email: "jane@example.com"})
    ]

    Enum.each(bots, &Repo.insert!(&1))

    response = build_conn()
    |> get(bot_path(build_conn(), :index))
    |> json_response(200)

    expected = %{
      "data" => [
        %{ "name" => "John", "email" => "john@example.com"},
        %{ "name" => "Jane", "email" => "jane@example.com"}
      ]
    }

    assert response == expected
  end

  describe "create/2" do
    test "Responds with a newly created user if attributes are valid"
    test "Returns an error and does not create a user if attributes are invalid"
  end

  describe "show/2" do
    test "Responds with a newly created user if the user is found" do
      bot = Bot.changeset(%Bot{}, %{name: "John", email: "john@example.com"})
      |> Repo.insert!

      response = build_conn()
      |> get(bot_path(build_conn(), :show, bot.id))
      |> json_response(200)

      expected = %{ "data" => %{ "name" => "John", "email" => "john@example.com" } }
      
      assert response == expected
    end
    test "Responds with a message indicating user not found"
  end

  describe "update/2" do
    test "Edits, and responds with the user if attributes are valid"
    test "Returns an error and does not edit the user if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the user was deleted"
end