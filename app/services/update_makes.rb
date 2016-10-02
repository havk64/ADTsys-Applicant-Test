class UpdateMakes < UpdateAPI
  def initialize
    @path   = '/carro/marcas'
    @data   = {}
    @size   = Make.all.size
  end

  def add_to_db(json)
    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      if Make.where(name: make_params['Nome']).size.zero?
        Make.create(name: make_params['Nome'], webmotors_id: make_params['Id'])
      end
    end
  end
end
