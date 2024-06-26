require 'time'
class Transacao
  attr_reader :data, :descricao, :valor
  attr_writer :data, :descricao, :valor
  def initialize(valor, data = Time.now, descricao)
    @valor = valor
    @data = data
    @descricao = descricao
  end

  def to_s
    "Data:#{@data} - #{@valor} - #{@descricao}"
  end
end
