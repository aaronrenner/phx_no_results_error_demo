defmodule SampleApp.BookstoreFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SampleApp.Bookstore` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> SampleApp.Bookstore.create_book()

    book
  end
end
