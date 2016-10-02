class UpdateAPI
  def api_request(path, data)
    uri = URI('http://www.webmotors.com.br')
    uri.path = path
    # Build the http POST request
    response = Net::HTTP.start uri.host, uri.port do |http|
      req = Net::HTTP::Post.new uri
      req.form_data = data
      http.request req
    end
    JSON.parse response.body
  end

  # Catch connection errors to be sure that the Application don't rely on
  # Webmotors API availability to keep working.
  def update
    response = api_request @path, @data
  rescue SocketError => error
    puts 'Error connecting to API => SocketError', error
  rescue => error
    puts "Error connecting to API => #{error.class}", error
  else
    # Make db requests/insertions just when new item was added
    puts response.size, @size
    add_to_db(response) if response.uniq.size > @size
  end
end
