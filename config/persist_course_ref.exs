use Mix.Config

config :islands_text_client,
  course_ref:
    """
    Inspired by the course [Elixir for Programmers]
    (https://codestool.coding-gnome.com/courses/
    elixir-for-programmers) by Dave Thomas.
    """
    |> String.replace("\n", "")
