class CreateBarbers < ActiveRecord::Migration[6.1]
  def change
  	create_table :barbers do |t|
  		t.text :name

  		t.timestamps
  	end

  	Barber.create :name => 'Jessie'
  	Barber.create :name => 'Mike'
 	Barber.create :name => 'Gus'
  end
end