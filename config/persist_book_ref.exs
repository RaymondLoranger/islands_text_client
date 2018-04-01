use Mix.Config

config :islands_text_client,
  book_ref:
    """
    Inspired by the book [Functional Web Development]
    (https://pragprog.com/book/lhelph/functional-web-development-
    with-elixir-otp-and-phoenix) by Lance Halvorsen.
    """
    |> String.replace("\n", "")
