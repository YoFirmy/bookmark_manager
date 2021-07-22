feature 'delete bookmark' do
  scenario 'user can delete a bookmark' do
    Bookmark.create(url: 'www.example.com', title: 'Example')

    visit('/bookmarks')

    expect(page).to have_link('Example', href: 'www.example.com')

    first('.bookmark').click_button('Delete')
    
    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Example', href: 'www.example.com')
  end
end