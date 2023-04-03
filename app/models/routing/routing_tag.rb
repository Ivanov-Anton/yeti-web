# frozen_string_literal: true

# == Schema Information
#
# Table name: class4.routing_tags
#
#  id   :integer(2)       not null, primary key
#  name :string           not null
#
# Indexes
#
#  routing_tags_name_key  (name) UNIQUE
#

class Routing::RoutingTag < ApplicationRecord
  include WithPaperTrail
  self.table_name = 'class4.routing_tags'

  NOT_TAGGED = 'not tagged'
  ANY_TAG = 'any tag'

  has_many :customers_auths, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.tag_action_value)", tag.id) }, class_name: 'CustomersAuth', autosave: false
  has_many :numberlists, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.tag_action_value)", tag.id) }, class_name: 'Routing::Numberlist', autosave: false
  has_many :numberlist_items, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.tag_action_value)", tag.id) }, class_name: 'Routing::NumberlistItem', autosave: false

  has_many :detection_rules, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.tag_action_value)", tag.id) }, class_name: 'Routing::RoutingTagDetectionRule', autosave: false
  has_many :dialpeers, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.routing_tag_ids)", tag.id) }, class_name: 'Dialpeer', autosave: false
  has_many :destinations, ->(tag) { unscope(:where).where("? = ANY(#{table_name}.routing_tag_ids)", tag.id) }, class_name: 'Routing::Destination', autosave: false

  has_many :rate_management_projects,
           ->(tag) { unscope(:where).where("? = ANY(#{table_name}.routing_tag_ids)", tag.id) },
           class_name: 'RateManagement::Project',
           autosave: false

  has_many :active_rate_management_pricelist_items,
           ->(tag) { unscope(:where).not_applied.where("? = ANY(#{table_name}.routing_tag_ids)", tag.id) },
           class_name: 'RateManagement::PricelistItem',
           autosave: false

  validates :name,
            presence: true,
            uniqueness: true,
            exclusion: { in: [ANY_TAG, NOT_TAGGED] },
            format: { with: /\A[^\s][^,]+?[^\s]\z/ } # not allow: ',' and start/end spaces

  before_destroy :prevent_destroy_if_have_assosiations

  before_validation :name_to_lowercase

  def display_name
    "#{name} | #{id}"
  end

  private

  def name_to_lowercase
    name.downcase! if name.present?
  end

  def prevent_destroy_if_have_assosiations
    associations = active_assosiations

    if associations.any?
      errors.add(:base, "Has related #{associations.join(', ')}")
    end

    project_ids = rate_management_projects.pluck(:id)
    if project_ids.any?
      errors.add(:base, "Can't be deleted because linked to Rate Management Project(s) ##{project_ids.join(', #')}")
    end

    # we allow keeping deleted routing tag IDs in applied rate management pricelist items
    # because it does not break anything and such records are used only as a temporary history
    pricelist_ids = active_rate_management_pricelist_items.pluck(Arel.sql('DISTINCT(pricelist_id)'))
    if pricelist_ids.any?
      errors.add(:base, "Can't be deleted because linked to not applied Rate Management Pricelist(s) ##{pricelist_ids.join(', #')}")
    end

    throw(:abort) if errors.any?
  end

  def active_assosiations
    associations = []
    associations << 'Customer Auth' if customers_auths.exists?
    associations << 'Numberlist' if numberlists.exists?
    associations << 'Numberlist Item' if numberlist_items.exists?
    associations << 'Detection Rule' if detection_rules.exists?
    associations << 'Dialpeer' if dialpeers.exists?
    associations << 'Destination' if destinations.exists?
    associations
  end
end
