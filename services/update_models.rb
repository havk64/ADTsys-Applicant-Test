class UpdateModels
  def initialize make, params
    @make = make
    @params = params
  end
  # Catch connection errors to be sure that the Application don't rely on
  # Webmotors API availability to keep working.
  def update
    begin
      response = request
    rescue Exception => error
      puts "Error connecting to API"
      puts error
    end
    add_to_db(response) if response.size > Model.where(make_id: @make.id).size
  end

  private
    def request
      uri = URI("http://www.webmotors.com.br/carro/modelos")

      response = Net::HTTP.post_form(uri, { marca: @params })
      json = JSON.parse response.body
      return json
    end

    def add_to_db(json)
      # Itera no resultado e grava os modelos que ainda não estão persistidas
      json.each do |item|
        if Model.where(name: item["Nome"], make_id: @make.id).size == 0
          Model.create(make_id: @make.id, name: item["Nome"])
        end
      end
    end
end
