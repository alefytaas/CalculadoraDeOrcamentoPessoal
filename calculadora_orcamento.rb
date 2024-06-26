require_relative 'receita'
require_relative 'despesa'
require 'time'

class CalculadoraOrcamento
  def initialize
    @receitas = []
    @despesas = []
  end

  def adicionar_receita(receita)
    @receitas << receita
  end

  def adicionar_despesa(despesa)
    @despesas << despesa
  end

  def menu
    puts "teste"
    laco = true
    while laco
      puts "Menu"
      puts "1 - Adicionar Transação"
      puts "2 - Mostrar Transações"
      puts "3 - Calcular Saldo Final"
      puts "4 - Sair"

      puts "Digite sua opção: "
      opcao = gets.chomp.to_i

      case opcao
      when 1
        puts "Qual o tipo da transação? 1 - Receita, 2 - Despesa"
        tipo = gets.chomp.to_i
        puts "Qual o valor da transação?"
        valor = gets.chomp.to_f
        puts "Qual a descrição da transação?"
        descricao = gets.chomp
        puts "Qual a data da transação ex: ANO-MES-DIA? Se for hoje digite 0"
        data = gets.chomp

        if tipo == 1
          case data
          when "0"
            adicionar_receita(Receita.new(valor, descricao))
          else
            adicionar_receita(Receita.new(valor, descricao, Time.parse(data)))
          end
        else
          case data
          when "0"
            adicionar_despesa(Despesa.new(valor, descricao))
          else
            adicionar_despesa(Despesa.new(valor, descricao, Time.parse(data)))
          end
        end

      when 2
        puts "Receitas:"
        @receitas.each { |receita| puts receita }
        puts "Despesas:"
        @despesas.each { |despesa| puts despesa }

      when 3
        soma_receita = 0
        soma_despesa = 0

        @receitas.each { |receita| soma_receita += receita.valor }
        @despesas.each { |despesa| soma_despesa += despesa.valor }

        puts "Saldo Final: #{soma_receita - soma_despesa}"

      when 4
        laco = false

      else
        puts "Opção inválida. Tente novamente."
      end
    end
  end
end

calculadora = CalculadoraOrcamento.new
calculadora.menu

