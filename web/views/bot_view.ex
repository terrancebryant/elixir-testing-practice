defmodule Testing.BotView do
  use Testing.Web, :view

  def render("index.json", %{bots: bots}) do
    %{data: render_many(bots, Testing.BotView, "bot.json")}
  end

  def render("show.json", %{bot: bot}) do
    %{data: render_one(bot, Testing.BotView, "bot.json")}
  end

  def render("bot.json", %{bot: bot}) do
    %{name: bot.name, email: bot.email}
  end

end