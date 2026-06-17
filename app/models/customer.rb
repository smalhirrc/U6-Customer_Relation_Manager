class Customer < ApplicationRecord
    has_one_attached :image

    def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
    end

    def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at"]
    end

    validates :full_name, presence: true
end

ActiveSupport.on_load(:active_storage_record) do
  def self.ransackable_attributes(auth_object = nil)
    ["blob_id", "created_at", "id", "name", "record_id", "record_type"]
  end
end