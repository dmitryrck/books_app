# Dependencies

This software uses:

* Ruby;
* SQLite or PostgreSQL (production);
* Redis (production);

# Up and Running

    git clone https://github.com/dmitryrck/books_app.git
    cd books_app
    bundle install
    cp config/database.yml.sample config/database.yml
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rails server

Open [http://localhost:3000](http://localhost:3000).

# Maintener

Dmitry Rocha [@dmitryrck at github](http://github.com/dmitryrck), and
[@dmitryrck at twitter](http://twitter.com/dmitryrck).

See [Contributors](https://github.com/dmitryrck/books_app/graphs/contributors)
to know everyone that contributed :)

# Contributing

We appreciate any contribution. Check out [CONTRIBUTING.md](CONTRIBUTING.md)
for more information.

# License

[MIT](http://opensource.org/licenses/MIT).
