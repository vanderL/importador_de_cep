class CreateCorreiosCep < ActiveRecord::Migration
  def change
    create_table :correios_ceps do |t|
      t.string :cep, null: false
      t.string :uf, null: false
      t.string :logradouro, null: false
      t.string :tipo_logradouro, null: false
      t.string :logradouro_com_tipo, null: false
      #t.integer :cidade_id
      t.references :correios_localidade, index: true, foreign_key: true , null: false
    end
  end
end
