use Mix.Config

config :islands_text_client,
  book_and_course_ref:
    """
    Inspired by the book [Functional Web Development]
    (https://pragprog.com/book/lhelph/functional-web-development-
    with-elixir-otp-and-phoenix) by Lance Halvorsen\s
    and the course [Elixir for Programmers]
    (https://codestool.coding-gnome.com/courses/
    elixir-for-programmers) by Dave Thomas.
    """
    |> String.replace("\n", "")
