feature 'add a comment' do
  scenario 'add a comment to a bookmark' do
    bookmark = Bookmark.create(url: 'https://example.com/', title: 'Example Title')

    visit('/bookmarks')
    first('.bookmark').click_button("Add Comment")
    
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/comments/new")

    fill_in('comment', with: 'Example Comment')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(first('.bookmark')).to have_content('Example Comment')
  end
end