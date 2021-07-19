feature 'initial set up' do
  scenario 'Home page returns hello' do
    visit('/')
    expect(page).to have_content 'Hello!'
  end
end
