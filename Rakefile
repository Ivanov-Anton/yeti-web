#!/usr/bin/env rake
# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('config/application', __dir__)

Yeti::Application.load_tasks

unless SecondBase.config
  raise ActiveRecord::AdapterNotFound, 'database.yml#secondbase is not specified'
end
