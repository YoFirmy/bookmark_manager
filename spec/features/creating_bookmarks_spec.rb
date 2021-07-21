feature 'Adding a new bookmark' do
  scenario 'user can create a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.youtube.com/user/shiffman')
    fill_in('title', with: 'Coding train')
    click_button('Add bookmark')

    expect(page).to have_link('Coding train', href: 'https://www.youtube.com/user/shiffman')
  end
end