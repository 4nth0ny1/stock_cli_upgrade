# db/migrate/01_create_artists.rb

class CreatePorfolio < ActiveRecord::Migration[5.2]
    def change 
        create_table :stocks do |t|
            t.string :companyName 
            t.integer :latestPrice 
        end
    end 
  end 