feature 'bookmarks view' do
  scenario 'shows the list of bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content 'https://cssbattle.dev/'
    expect(page).to have_content 'https://flexboxfroggy.com/'
    expect(page).to have_content 'https://www.codewars.com/users/YoFirmy'
  end
end
