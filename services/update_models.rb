class UpdateModels
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
      uri = URI("http://www.webmotors.com.br/carro/modelos")
      make = Make.where(webmotors_id: params[:webmotors_make_id])[0]

      response = Net::HTTP.post_form(uri, { marca: params[:webmotors_make_id] })
      models_json = JSON.parse response.body
      puts models_json.size
      puts

      # Itera no resultado e grava os modelos que ainda não estão persistidas
      models_json.each do |item|
        if Model.where(name: item["Nome"], make_id: make.id).size == 0
          Model.create(make_id: make.id, name: item["Nome"])
        end
      end
    end
end
