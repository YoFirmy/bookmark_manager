require 'database_helpers'
require 'comment'
require 'bookmark'

describe Comment do
  describe '.create' do
      it 'creates a new comment' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      comment = Comment.create(text: 'Example comment', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a(Comment)
      expect(comment.text).to eq('Example comment')
      expect(comment.bookmark_id).to eq(bookmark.id)
      expect(comment.id).to eq(persisted_data[0]['id'])
    end
  end

  describe '.where' do
    it 'returns an array of comments' do
      bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example')
      Comment.create(text: 'This is a test comment', bookmark_id: bookmark.id)
      Comment.create(text: 'This is a second test comment', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id).first

      expect(comments.length).to eq(2)
      expect(comment.id).to eq(persisted_data['id'])
      expect(comment.text).to eq('This is a test comment')
      expect(comment.bookmark_id).to eq(bookmark.id)
    end
  end
end