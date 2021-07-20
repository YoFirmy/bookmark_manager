require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns a list of all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://cssbattle.dev/')
      expect(bookmarks).to include('https://flexboxfroggy.com/')
      expect(bookmarks).to include('https://www.codewars.com/')
    end
  end
end
