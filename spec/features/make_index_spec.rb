RSpec.feature "Webmotors API" do
  scenario "Visiting the index page first time" do
    # Ensure database is clean before first page access
    before_count = Make.all.size
    expect(before_count).to eq(0) # it should be zero
    visit root_path # first access
    after_count = Make.all.size
    # After first access the amount of items on database needs to increase
    expect(after_count).not_to eq(before_count)
    expect(after_count).to be <= 179
    expect(page).to have_text "Escolha a Fabricante:"
  end

  scenario "Choosing one random Maker" do
    # Random integer between 2 and 179 (1 has empty name)
    rand_id = rand(2..179)
    visit root_path # Visit index page
    # In select element we choose a random item
    rand_make = find("#webmotors_make_id > option:nth-child(#{rand_id})")
    rand_make.select_option
    find("[name=commit]").click # click submit
    # Given the size of elements in DB related to this random item...
    make_size = Make.joins(:models).where(name: rand_make.text).size
    list = find('ul').all('li')
    # Is expected to get the same amount of elements displayed on the page.
    expect(list.size).to eq(make_size)
    # Is expected to have at least one item by Brand
    expect(list.size).to be > 0
  end
end
