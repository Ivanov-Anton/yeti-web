# frozen_string_literal: true

ActiveAdmin.register Report::VendorTraffic, as: 'VendorTraffic' do
  menu parent: 'Reports', label: 'Vendor traffic', priority: 12
  config.batch_actions = true
  actions :index, :destroy, :create, :new

  controller do
    def build_new_resource
      Report::VendorTrafficForm.new(*resource_params)
    end

    def scoped_collection
      super.preload(:vendor)
    end
  end

  report_scheduler Report::VendorTrafficScheduler

  filter :id
  boolean_filter :completed
  filter :date_start, as: :date_time_range
  filter :date_end, as: :date_time_range
  filter :created_at, as: :date_time_range
  contractor_filter :vendor_id_eq, label: 'Vendor', path_params: { q: { vendor_eq: true } }

  index do
    selectable_column
    id_column
    actions do |row|
      link_to 'View', vendor_traffic_vendor_traffic_data_path(row)
    end
    column :completed
    column :created_at
    column :vendor
    column :date_start
    column :date_end
  end

  permit_params :date_start,
                :date_end,
                :vendor_id,
                send_to: []

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
      f.input :date_start,
              as: :date_time_picker,
              wrapper_html: {
                class: 'datetime_preset_pair',
                data: { show_time: 'true' }
              }

      f.input :date_end,
              as: :date_time_picker

      f.contractor_input :vendor_id,
                         label: 'Vendor',
                         path_params: { q: { vendor_eq: true } }

      f.input :send_to,
              as: :select,
              input_html: { class: 'chosen', multiple: true },
              collection: Billing::Contact.collection,
              hint: f.object.send_to_hint
    end
    f.actions
  end
end
