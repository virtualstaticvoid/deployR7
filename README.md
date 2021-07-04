# Example Plumber App on Heroku

This is an example [Plumber][1] application, which uses [heroku-docker-r][2] for Heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

You can use this project as a template for creating Plumber applications on Heroku. Execute these commands to get started:

```bash
# get the sources
git clone https://github.com/virtualstaticvoid/heroku-docker-r-plumber-app.git
cd heroku-docker-r-plumber-app

# optionally, reinitialize git
rm -rf .git
git init
git add --all
git commit -m "initial"

# create a new heroku application and deploye
heroku create --stack=container
git push heroku master

# view the application
heroku open
```

The following paths are provided:

* [`/echo?msg=MSG`](plumber.R#L14)
* [`/plot`](plumber.R#L21)
* [`/sum?x=X&y=Y`](plumber.R#L30)

The OpenAPI (Swagger) user-interface is available via the [`/__docs__/`](app.R#L10) path.

## License

MIT License. Copyright (c) 2020 Chris Stefano. See [MIT_LICENSE](MIT_LICENSE) for details.

[1]: https://www.rplumber.io
[2]: https://github.com/virtualstaticvoid/heroku-docker-r
