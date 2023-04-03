# frozen_string_literal: true

ActiveAdmin.register System::NetworkPrefix do
  actions :all
  menu parent: 'System', label: 'Network Prefixes', priority: 131
  config.batch_actions = false

  permit_params :prefix, :country_id, :network_id, :number_min_length, :number_max_length

  controller do
    def scoped_collection
      super.eager_load(:country, :network)
    end
  end

  collection_action :prefix_hint do
    render plain: System::NetworkPrefix.prefix_hint(params[:prefix])
  end

  filter :id
  filter :uuid_equals, label: 'UUID'
  filter :prefix
  filter :country, input_html: { class: 'chosen' }
  filter :network, input_html: { class: 'chosen' }
  filter :number_contains
  filter :number_min_length
  filter :number_max_length

  index do
    id_column
    column :prefix
    column :country, sortable: 'countries.name'
    column :network, sortable: 'networks.name'
    column :number_min_length
    column :number_max_length
    column :uuid
  end

  show do
    attributes_table do
      row :id
      row :prefix
      row :country
      row :network
      row :number_min_length
      row :number_max_length
      row :uuid
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs form_title do
      f.input :prefix
      f.input :country, input_html: { class: 'chosen' }
      f.input :network, input_html: { class: 'chosen' }
      f.input :number_min_length
      f.input :number_max_length
    end
    f.actions
  end
end
