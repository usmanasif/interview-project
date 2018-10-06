require "sinatra/activerecord"
Dir[File.join('app/models', '**/author.rb')].each { |file| require File.expand_path(file) }

RSpec.describe Author, type: :model do
  author = FactoryBot.build(:author)

  it "is valid with a valid attributes" do
    author = FactoryBot.build(:author)
    expect(author.save).to be_truthy
  end

  context 'validations' do
    subject { FactoryBot.build(:author) }

    it { should validate_presence_of(:name) }

    describe '#email' do
      it { should validate_uniqueness_of(:email) }
      it { should validate_presence_of(:email) }
      it { should_not allow_value("blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
    end
  end

end
