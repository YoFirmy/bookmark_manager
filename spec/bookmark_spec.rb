require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      bookmark = Bookmark.create(url: 'https://cssbattle.dev/', title: 'CSS battle')
      Bookmark.create(url: 'https://flexboxfroggy.com/', title: 'Flexbox froggy')
      Bookmark.create(url: 'https://www.codewars.com/', title: 'Codewars')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq('CSS battle')
      expect(bookmarks.first.url).to eq('https://cssbattle.dev/')
    end
  end

  describe '.create' do
    it 'does not create a new bookmark if an invalid URL is submitted' do
      Bookmark.create(url: 'invalid URL', title: 'Example')
      expect(Bookmark.all).to be_empty
    end

    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks').first

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq(persisted_data['id'])
      expect(bookmark.url).to eq('https://example.com/')
      expect(bookmark.title).to eq('Example')
    end
  end

  describe '.delete' do
    it 'destroys a bookmark' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.exampletypo.com', title: 'ExampleTypo')
      updated_bookmark = Bookmark.update(url: 'http://www.example.com', title: 'Example', id: bookmark.id)

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq(bookmark.id)
      expect(updated_bookmark.url).to eq('http://www.example.com')
      expect(updated_bookmark.title).to eq('Example')
    end
  end

  describe '.find' do
    it 'returns the requested bookmark' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.url).to eq('https://example.com/')
      expect(result.title).to eq('Example')
      expect(result.id).to eq(bookmark.id)
    end
  end

  describe '#comments' do
    it 'returns the bookmarks comments' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('Example Comment', '#{bookmark.id}');")
      comment = bookmark.comments.first
      expect(comment.text).to eq('Example Comment')
    end

    let(:comment_class) { double(:comment_class) }

    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class: comment_class)
    end
  end
end
