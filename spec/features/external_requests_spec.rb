feature "Should not rely on external API" do
  # Using WebMock to disable external connection
  WebMock.disable_net_connect!(allow_localhost: true)
  scenario 'When connection to Webmotors API fails' do
    err_msg = 'Error connecting to API => SocketError'
    # WebMock stub request to simulate connection failure(SocketError)
    stub_request(:post, "http://www.webmotors.com.br/carro/marcas").
      with(:headers => {'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/x-www-form-urlencoded',
        'Host'=>'www.webmotors.com.br',
        'User-Agent'=>'Ruby'}).
      to_raise(SocketError)
    # It should log the error using Rails.logger
    expect(Rails.logger).to receive(:error).with(err_msg)
    expect(Rails.logger).to receive(:error).with('Exception from WebMock')
    visit root_path # visit index page
    # And the page should load normally
    expect(page).to have_text "Applicant Test"
    expect(page).to have_selector 'form > p > label', text: "Escolha a Fabricante:"
  end
end
