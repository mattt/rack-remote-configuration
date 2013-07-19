Rack::RemoteConfiguration
=========================
**Serve property list or JSON configuration files**

Although mobile and rich web clients consume resources from a server, there may be some application details that you'd like to coordinate outside of the resource structure of an API.

**Remote Configuration** is a great way to break out client-specific details into a single, orthogonal endpoint, such as [feature flags](http://code.flickr.com/blog/2009/12/02/flipping-out/), impromptu [A/B tests](http://en.wikipedia.org/wiki/A/B_testing), or a simple ["message of the day"](http://en.wikipedia.org/wiki/Motd_%28Unix%29)

## Usage

### config.ru

```ruby
run Rack::RemoteConfiguration.new configuration: {
      'Greeting' => "Hello, World",
      'Price' => 4.20,
      'FeatureXIsLaunched' => true
    }
```

### Parameters

- `configuration`: a `Hash`, or `File` or a `.json` or `.plist` file path with the specified configuration.
- `path`: the endpoint to serve the configuration, relative to the mount root of the application. _(defaults to `/configuration`)_

## iOS Client Integration

> [GroundControl](https://github.com/mattt/GroundControl) gives you a dead-simple way to remotely configure your app's [User Defaults](http://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSUserDefaults_Class/).

```objective-c
NSURL *URL = [NSURL URLWithString:@"http://example.com/defaults.plist"];
[[NSUserDefaults standardUserDefaults] registerDefaultsWithURL:URL];
```

See the [GroundControl README](https://github.com/mattt/GroundControl/blob/master/README.md) for further guidance on installation & usage.

## Deployment

`Rack::RemoteConfiguration` can be deployed to Heroku with the following commands:

```
$ heroku create
$ git push heroku master
```

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

Rack::RemoteConfiguration is available under the MIT license. See the LICENSE file for more info.
