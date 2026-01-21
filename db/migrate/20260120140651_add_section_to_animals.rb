class AddSectionToAnimals < ActiveRecord::Migration[8.1]
  def change
    # null: false -> 앞으로 입력할 때는 비워둘 수 없음
    add_column :animals, :section, :string, null: false
  end
end
