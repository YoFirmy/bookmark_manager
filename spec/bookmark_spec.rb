require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns a list of all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('https://cssbattle.dev/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://flexboxfroggy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.codewars.com/');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://cssbattle.dev/')
      expect(bookmarks).to include('https://flexboxfroggy.com/')
      expect(bookmarks).to include('https://www.codewars.com/')
    end
  end
end
