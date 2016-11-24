class CreateCorreiosLocalidade < ActiveRecord::Migration
  def change
    create_table :correios_localidades do |t|
      t.string :uf, null: false
      t.string :localidade, null: false
      t.string :localidade_resumida, null: false
    end
  end
end
