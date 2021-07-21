feature 'bookmarks view' do
  scenario 'shows the list of bookmarks' do
    Bookmark.create(url: 'https://cssbattle.dev/', title: 'CSS battle')
    Bookmark.create(url: 'https://flexboxfroggy.com/', title: 'Flexbox Froggy')
    Bookmark.create(url: 'https://www.codewars.com/', title: 'Codewars')

    visit('/bookmarks')
    
    expect(page).to have_link('CSS battle', href: 'https://cssbattle.dev/')
    expect(page).to have_link('Flexbox Froggy', href: 'https://flexboxfroggy.com/')
    expect(page).to have_link('Codewars', href: 'https://www.codewars.com/')
  end
end
