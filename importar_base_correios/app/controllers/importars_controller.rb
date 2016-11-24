class ImportarsController < ApplicationController


  # GET /importars
  # GET /importars.json
  def index
    ActiveRecord::Base.transaction do 
      importar_ceps_localidades
      importar_ceps_logradouros
    end
  end

  def importar_ceps_logradouros
    records = Dir.glob("/home/inu/desenvolvimento/Materiais Diversos/Base Correios/eDNE_Basico/Delimitado/LOG_UF/*")
    lista_registros =  Array.new

    records.each do |arquivo_path|

      File.open(arquivo_path, 'r') do |arquivo|
        if !arquivo_path.include? 'LOG_LOCALIDADE.txt'

          puts '###### Lendo arquivo: ' + arquivo_path.split("/").last
          arquivo.each do |linha|

            registro = CorreiosCep.new
            linha_array = linha.squish().split('@')

            registro.uf = linha_array[1]
            registro.logradouro = linha_array[5].gsub("'", "''")
            registro.cep = linha_array[7]
            registro.tipo_logradouro = linha_array[8]
            registro.logradouro_com_tipo = linha_array[10].gsub("'", "''")
            registro.correios_localidade_id = linha_array[2]

            lista_registros << registro
            
          end
        end    
      end
    end

    puts '###### Inicio de Insert no Banco de dados'
   
    lista_registros.each_slice(1000) do | registro |
      CorreiosCep.connection.execute("INSERT INTO aptapost_desenv.dbo.correios_ceps
        (cep, uf, logradouro, tipo_logradouro, logradouro_com_tipo, correios_localidade_id)
        VALUES  #{registro.map{|r| "('#{r.cep}', '#{r.uf}', '#{r.logradouro}','#{r.tipo_logradouro}', 
        '#{r.logradouro_com_tipo}',#{r.correios_localidade_id} )"}.join(', ')}")
    end
    
  end

  def importar_ceps_localidades #CIDADES
    records = Dir.glob("/home/vander/desenvolvimento/Materiais Diversos/Base Correios/eDNE_Basico/Delimitado/LOG_UF/*")
    lista_registros =  Array.new

    records.each do |arquivo_path|

      File.open(arquivo_path, 'r') do |arquivo|

        if arquivo_path.include? 'LOG_LOCALIDADE.txt'

          puts '###### Lendo arquivo: ' + arquivo_path.split("/").last
          arquivo.each do |linha|

            registro = CorreiosLocalidade.new
            linha_array = linha.squish().split('@')
            registro.id = linha_array[0]
            registro.uf = linha_array[1]
            registro.localidade = linha_array[2].gsub("'", "''")
            registro.localidade_resumida = linha_array[7].gsub("'", "''")

            lista_registros << registro
            
          end
        end    
      end
    end

    puts '###### Inicio de Insert no Banco de dados'
    
    lista_registros.each_slice(1000) do | registro |
      CorreiosLocalidade.connection.execute("INSERT INTO aptapost_desenv.dbo.correios_localidades
        (id, uf, localidade, localidade_resumida)
        VALUES  #{registro.map{|r| "(#{r.id}, '#{r.uf}', '#{r.localidade}','#{r.localidade_resumida}')"}.join(', ')}")
    end
  end
end