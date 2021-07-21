feature 'Adding a new bookmark' do
  scenario 'user can create a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.youtube.com/user/shiffman')
    click_button('Add bookmark')

    expect(page).to have_content('https://www.youtube.com/user/shiffman')
  end
end