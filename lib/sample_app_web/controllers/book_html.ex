defmodule SampleAppWeb.BookHTML do
  use SampleAppWeb, :html

  embed_templates "book_html/*"

  @doc """
  Renders a book form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def book_form(assigns)
end
