use Mix.Config

config :islands_text_client,
  book_ref:
    """
    Inspired by the book [Functional Web Development]
    (https://pragprog.com/book/lhelph/functional-web-development-
    with-elixir-otp-and-phoenix) by Lance Halvorsen.</br>
    Also inspired by the course [Elixir for Programmers]
    (https://codestool.coding-gnome.com/courses/
    elixir-for-programmers) by Dave Thomas.
    """
    |> String.replace("\n", "")
