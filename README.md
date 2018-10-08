## Development Environment

* Make sure that you have [Docker](https://www.docker.com/get-started) and [Docker Compose](https://docs.docker.com/compose/install/) installed.
* Clone the repo
* Run the `build_dev.sh` script in the root directory.
* Run `docker-compose -f dcd.yml up` to bring up the dev environment.
* Run `rake db:create` to create the database.
* Run `rake db:migrate` to create the database tables.
* Run `rake db:seed` to fill up the tables with mock data.
* Run `docker-compose -f dcd.yml run web rspec` to run the test suite.
