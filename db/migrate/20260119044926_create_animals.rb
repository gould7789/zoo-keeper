class CreateAnimals < ActiveRecord::Migration[8.1]
  def change
    create_table :animals do |t|
      t.string :name                 # 이름 (개체수가 많을 경우 비워도 됨)
      t.string :species, null: false # 동물의 종은 필수로 입력
      t.integer :age                 # 나이 (개체수가 많을 경우 비워도 됨)
      t.integer :quantity, null: false, default: 1 # 개체수 (필수 입력 및 안 적으면 1마리)
      t.text :description

      t.timestamps
    end
  end
end
