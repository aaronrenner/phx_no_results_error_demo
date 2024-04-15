defmodule SampleApp.BookstoreTest do
  use SampleApp.DataCase

  alias SampleApp.Bookstore

  describe "books" do
    alias SampleApp.Bookstore.Book

    import SampleApp.BookstoreFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Bookstore.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Bookstore.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Book{} = book} = Bookstore.create_book(valid_attrs)
      assert book.description == "some description"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookstore.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Book{} = book} = Bookstore.update_book(book, update_attrs)
      assert book.description == "some updated description"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookstore.update_book(book, @invalid_attrs)
      assert book == Bookstore.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Bookstore.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Bookstore.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Bookstore.change_book(book)
    end
  end
end
