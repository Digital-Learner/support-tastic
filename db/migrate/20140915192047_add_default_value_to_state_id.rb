class AddDefaultValueToStateId < ActiveRecord::Migration
  def change
    state = State.find_by(name: 'Waiting for Staff Response')
    if state.nil?
      state = State.create(name: 'Waiting for Staff Response')
    end
    puts "Adding default value '#{state.id} for #{state.name}' to table 'Tickets'"

    change_column_default(:tickets, :state_id, state.id)
  end
end
