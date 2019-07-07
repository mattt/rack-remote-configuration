# Rack::RemoteConfiguration

**Serve property list or JSON configuration files**

Although mobile and rich web clients consume resources from a server,
there may be some application details
that you'd like to coordinate outside of the resource structure of an API.

**Remote Configuration** is a great way to break out client-specific details
into a single, orthogonal endpoint,
such as [feature flags](http://code.flickr.com/blog/2009/12/02/flipping-out/),
impromptu [A/B tests](http://en.wikipedia.org/wiki/A/B_testing),
or a simple ["message of the day"](http://en.wikipedia.org/wiki/Motd_%28Unix%29)

## Installation

### Gemfile

````ruby
gem 'rack-remote-configuration', require: 'rack/remote-configuration'
```

## Usage

### config.ru

```ruby
run Rack::RemoteConfiguration.new configuration: {
      'Greeting' => "Hello, World",
      'Price' => 4.20,
      'FeatureXIsLaunched' => true
    }
````

### Parameters

- `configuration`: a `Hash`, or `File` or a `.json` or `.plist` file path with the specified configuration.
- `path`: the endpoint to serve the configuration, relative to the mount root of the application. _(defaults to `/configuration`)_

## Deployment

`Rack::RemoteConfiguration` can be deployed to Heroku with the following commands:

```
$ heroku create
$ git push heroku master
```

## Contact

[Mattt](https://twitter.com/mattt)

## License

Rack::RemoteConfiguration is available under the MIT license.
See the LICENSE file for more info.
