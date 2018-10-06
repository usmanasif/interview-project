require "sinatra/activerecord"
Dir[File.join('app/models', '**/*.rb')].each { |file| require File.expand_path(file) }

RSpec.describe Book, type: :model do

  it "is valid with a valid attributes" do
    book = FactoryBot.build(:book)
    expect(book.save).to be_truthy
    authors = FactoryBot.create_list(:author, 10)
    book.authors << authors
    expect(book.authors.count).to eq(authors.count)

  end

  context 'validations' do
    subject { FactoryBot.build(:book) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:number_of_pages) }

    describe '#isbn' do
      it { should validate_uniqueness_of(:isbn).ignoring_case_sensitivity }
      it { should validate_presence_of(:isbn) }
    end

    describe '#authors' do
     it { should have_and_belong_to_many(:authors) }
    end
  end

end
