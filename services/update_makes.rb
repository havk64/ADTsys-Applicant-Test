class UpdateMakes
  # Catch connection errors to be sure that the Application don't rely on
  # Webmotors API availability to keep working.
  def update
    begin
      request
    rescue Exception => error
      puts "Error connecting to API"
      puts error
    end
  end

  private
    def request
      uri = URI("http://www.webmotors.com.br/carro/marcas")

      # Make request for Webmotors site
      response = Net::HTTP.post_form(uri, {})
      json = JSON.parse response.body
      puts json.size
      puts Make.all

      # Itera no resultado e grava as marcas que ainda não estão persistidas
      json.each do |make_params|
        if Make.where(name: make_params["Nome"]).size == 0
          Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
        end
      end
    end
end
