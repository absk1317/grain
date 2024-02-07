The project is set up with latest version of Ruby and Rails. The database used is Postgres. The project is set up with Rspec for testing and Rubocop for linting. The project is set up with git hooks for pre-commit.

- Ruby version: 3.2.2
- Rails version: 7.1.3
- Database: Postgres (15 or above)

The project requires minimal setup. Just run `bundle install` to install the required gems. Run `rails db:create db:migrate` to create the database and run the migrations. Run `rails db:seed` to seed the database with sample data.

Annotations are added to the models for schema information.
Haven't added soft delete functionality
Unit tests are added for the models and GraphQL queries, with 100% coverage.
Have added brakeman and rubocop for security and linting checks. (The checks run on every push to the repository on Github)

From what I understand, the menu is the top level entity. It has sections. Each section has section items. Each section item has items. Each item has item modifier groups. Each item modifier group has modifier groups. Each modifier group has modifiers:

menu -> sections -> section items -> items -> item modifier groups -> modifier groups -> modifiers

Below query can be used to get the menu with all the associations:

```graphql
query AllMenuItems {
  menu(id: 1) {
    id
    startDate
    identifier
    sections {
      label
      description
      items {
        id
        modifierGroups {
          id
          label
          minSelections
          maxSelections
          modifiers {
            id
            displayOrder
            defaultQuantity
          }
        }
      }
    }
  }
}
```

Deployment:

The project is set up with Mina for deployment. The deployment configuration is in `config/deploy.rb`

```bash
RAILS_ENV=staging DOMAIN=IP_HERE BRANCH=BRANCH_HERE mina deploy
```

Everytime a new commit is pushed to the main branch of the repository, the project is automatically deployed.

Backup:

1. We can configure backup using `backup` gem. Detailed instructions can be found here: https://adevelopersdiary.com/automated-database-backup-with-ruby-backup-gem/

Logging:

1. Use `lograge` gem for structured logging in JSON format.
2. Install ELK/Zinc Observe stack on a separate server.
3. Install filebeat/fluentd on the server.
4. Configure filebeat/fluentd to ship logs to the ELK or the Zinc Observe server.

Loadbalancing:
Recommend using Nginx as a reverse proxy server for load balancing and SSL termination.

Monitoring:

1. Use NewRelic for application performance monitoring.
2. Use metabase with ClickHouse or BQ for business intelligence and analytics.
3. Airflow/Airbyte for ETL and data pipeline.

Database:

1. As the application grows, we can use a managed database service like AWS RDS or Google Cloud SQL.
2. Use PgBouncer for connection pooling.
3. Use CloudSQL/RDS insights for database performance monitoring.
4. Use pgtune to optimize the database configuration.
5. Segregate the database into read and write replicas.

Deployment and Infrastructure:

1. Provision Server
2. Install PostgreSQL, nginx, rvm/rbenv
3. Add new user to postgres
4. Create new database
5. Install ruby 3.2.2 on server
6. Add service file for puma, enable and start
7. Add nginx config file for app, enable and start
8. Add DNS record for app
9. Add SSL certificate for app
