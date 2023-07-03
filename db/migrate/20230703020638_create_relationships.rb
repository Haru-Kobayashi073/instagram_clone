class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.bigint :follow_id
      t.bigint :follower_id

      t.timestamps
    end
  end
end
