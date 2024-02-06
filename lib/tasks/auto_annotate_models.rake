# frozen_string_literal: true

if Rails.env.development?
  require 'annotate'
  task set_annotation_options: :environment do
    Annotate.set_defaults(
      'routes' => 'false',
      'models' => 'true',

      'position_in_class' => 'after',
      'position_in_factory' => 'after',

      'show_foreign_keys' => 'true',
      'show_complete_foreign_keys' => 'false',
      'show_indexes' => 'true',
      'simple_indexes' => 'false',

      'exclude_tests' => 'true',
      'exclude_fixtures' => 'true',
      'exclude_factories' => 'false',
      'exclude_serializers' => 'true',

      'exclude_sti_subclasses' => 'false',

      'skip_on_db_migrate' => 'false',
      'format_bare' => 'true',
      'format_rdoc' => 'false',
      'format_yard' => 'false',
      'format_markdown' => 'false',
      'wrapper_open' => nil,
      'wrapper_close' => nil,
      'with_comment' => 'true'
    )
  end

  Annotate.load_tasks
end
