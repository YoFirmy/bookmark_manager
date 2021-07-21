feature 'bookmarks view' do
  scenario 'shows the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES('https://cssbattle.dev/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://flexboxfroggy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.codewars.com/');")

    visit('/bookmarks')
    expect(page).to have_content 'https://cssbattle.dev/'
    expect(page).to have_content 'https://flexboxfroggy.com/'
    expect(page).to have_content 'https://www.codewars.com/'
  end
end
