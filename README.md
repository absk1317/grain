The project is set up with latest version of Ruby and Rails. The database used is Postgres. The project is set up with Rspec for testing and Rubocop for linting. The project is set up with git hooks for pre-commit.

- Ruby version: 3.2.2
- Rails version: 7.1.3
- Database: Postgres

The project requires minimal setup. Just run `bundle install` to install the required gems. Run `rails db:create db:migrate` to create the database and run the migrations. Run `rails db:seed` to seed the database with sample data.

Annotations are added to the models for schema information.
Haven't added soft delete functionality
Unit tests are added for the models and GraphQL queries, with 100% coverage.

From what I understand, the menu is the top level entity. It has sections. Each section has section items. Each section item has items. Each item has item modifier groups. Each item modifier group has modifier groups. Each modifier group has modifiers:

menu -> sections -> section items -> items -> item modifier groups -> modifier groups -> modifiers
