class BookSerializer
  def initialize(book)
    @book = book
  end

  def as_json(*)
    data = {
      id: @book.id.to_s,
      title: @book.title,
      authors: @book.authors.pluck(:name).join(", "),
      number_of_authors: @book.authors.count,
      isbn: @book.isbn,
      published_at: @book.published_at
    }
    data[:errors] = @book.errors.full_messages if @book.errors.any?
    data
  end
end
