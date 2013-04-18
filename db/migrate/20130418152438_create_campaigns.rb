class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :user_id
      t.string :organization
      t.string :address
      t.string :title
      t.text :description
      t.integer :fundtarget
      t.integer :campaignlength
      t.datetime :datepublished
      t.integer :amountraised

      t.timestamps
    end
    add_index(:campaigns, :user_id)
  end
end