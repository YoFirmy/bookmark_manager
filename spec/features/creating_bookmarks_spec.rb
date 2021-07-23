feature 'Adding a new bookmark' do
  scenario 'user can create a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.youtube.com/user/shiffman')
    fill_in('title', with: 'Coding train')
    click_button('Add bookmark')

    expect(page).to have_link('Coding train', href: 'https://www.youtube.com/user/shiffman')
  end

  scenario 'Must be a valid url' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a url')
    click_button('Add bookmark')

    expect(page).not_to have_content('not a url')
    expect(page).to have_content "You must submit a valid URL."
  end
end