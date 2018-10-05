class AuthorSerializer
  def initialize(author)
    @author = author
  end

  def as_json(*)
    data = {
      id: @author.id.to_s,
      name: @author.name,
      email: @author.email,
      gender: @author.gender,
      address: @author.address,
      books_published: @author.books.count
    }
    data[:errors] = @author.errors.full_messages if @author.errors.any?
    data
  end
end
