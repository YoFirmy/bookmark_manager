feature 'bookmarks view' do
  scenario 'shows the list of bookmarks' do
    Bookmark.create(url: 'https://cssbattle.dev/')
    Bookmark.create(url: 'https://flexboxfroggy.com/')
    Bookmark.create(url: 'https://www.codewars.com/')

    visit('/bookmarks')
    
    expect(page).to have_content 'https://cssbattle.dev/'
    expect(page).to have_content 'https://flexboxfroggy.com/'
    expect(page).to have_content 'https://www.codewars.com/'
  end
end
