feature 'delete bookmark' do
  scenario 'user can delete a bookmark' do
    Bookmark.create(url: 'https://example.com/', title: 'Example')

    visit('/bookmarks')

    expect(page).to have_link('Example', href: 'https://example.com/')

    first('.bookmark').click_button('Delete')
    
    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Example', href: 'https://example.com/')
  end
end