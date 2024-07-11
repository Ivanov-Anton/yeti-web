# frozen_string_literal: true

ActiveAdmin.register Billing::Transaction, as: 'Transactions' do
  menu parent: 'Billing', label: 'Transactions', priority: 21

  actions :index, :show

  acts_as_export :id,
                 :created_at,
                 :account_id,
                 :service_id,
                 :amount,
                 :description

  decorate_with TransactionDecorator

  includes :account, :service

  filter :id
  filter :created_at
  account_filter :account_id_eq
  filter :service_id, label: 'Service ID'
  filter :amount
  filter :description

  scope :today
  scope :yesterday

  index do
    selectable_column
    id_column
    actions
    column :created_at
    column :account
    column :service, :service_link
    column :amount
    column :description
    column :uuid
  end

  show do
    attributes_table do
      row :id
      row :uuid
      row :created_at
      row :account
      row :service, &:service_link
      row :amount
      row :description
    end
  end
end
