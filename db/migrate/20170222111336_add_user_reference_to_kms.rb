class AddUserReferenceToKms < ActiveRecord::Migration
  def change
    add_reference :kms, :user, index: true, foreign_key: true
  end
end
