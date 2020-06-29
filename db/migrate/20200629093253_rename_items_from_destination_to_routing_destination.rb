class RenameItemsFromDestinationToRoutingDestination < ActiveRecord::Migration[5.2]
  def change
    reversible do |direction|
      suppress_messages do
        direction.up do
          execute <<-SQL
            update gui.versions set item_type = 'Routing::Destination' where item_type = 'Destination';
          SQL
        end
      end
    end
  end
end
