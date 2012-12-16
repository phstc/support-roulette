class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.column :name               , :string , null: false
      t.column :phone              , :string , null: false
      t.column :support_started_at , :date   , null: false, default: Date.today
    end
  end

  def self.down
    drop_table :agents
  end
end

