feature 'update bookmark' do
  scenario 'a user is able to update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.exampletypo.com', title: 'TypoExample')
    visit('/bookmarks')

    expect(page).to have_link('TypoExample', href: 'http://www.exampletypo.com')

    first('.bookmark').click_button('Edit')

    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")

    fill_in('url', with: 'http://www.example.com')
    fill_in('title', with: 'Example')
    click_button('Save bookmark')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('TypoExample', href: 'http://www.exampletypo.com')
    expect(page).to have_link('Example', href: 'http://www.example.com')
  end
end