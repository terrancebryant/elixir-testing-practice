defmodule Testing.BotController do
  use Testing.Web, :controller

  alias Testing.{Bot, Repo}

  def index(conn, _params) do
    bots = Repo.all(Bot)
    render conn, "index.json", bots: bots
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(Bot, id) do
      bot -> render conn, "show.json", bot: bot
    end
  end
end