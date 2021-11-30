# frozen_string_literal: true

# == Schema Information
#
# Table name: stir_shaken_trusted_repositories
#
#  id                         :integer(2)       not null, primary key
#  url_pattern                :string           not null
#  validate_https_certificate :boolean          default(TRUE), not null
#  updated_at                 :datetime
#
class Equipment::StirShaken::TrustedRepository < ApplicationRecord
  self.table_name = 'stir_shaken_trusted_repositories'

  include Yeti::StateUpdater
  self.state_name = 'stir_shaken_trusted_repositories'
end
