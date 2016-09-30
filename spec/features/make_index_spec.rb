RSpec.feature "Webmotors API" do
  scenario "Visiting the index page first time" do
    before_count = Make.all.size
    expect(before_count).to eq(0)
    visit root_path
    after_count = Make.all.size
    expect(after_count).not_to eq(before_count)
    expect(page).to have_text "Escolha a Fabricante:"
  end

  scenario "Choosing one random Maker" do
    rand_make = rand(1..179)
    visit root_path
    within '#webmotors_make_id' do
      find(:xpath, "option[#{rand_make}]").click
    end
    find("[name=commit]").click
    make_size = Make.joins(:models).where(id: rand_make).size
    list = find('ul').all('li')
    expect(list.size).to eq(make_size)
  end
end
