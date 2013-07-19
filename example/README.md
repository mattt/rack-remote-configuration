# Rack::RemoteConfiguration Example

## Requirements

- [Heroku Toolbelt](https://toolbelt.heroku.com)

## Instructions

To run the example application, run the following commands:

```sh
$ cd example
$ bundle
$ foreman start
```

...and then, in a new Terminal window:

```sh
$ curl -H "Accept: application/x-plist" http://localhost:5000/configuration
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>FeatureXIsLaunched</key>
	<true/>
	<key>Greeting</key>
	<string>Hello, World</string>
	<key>Price</key>
	<real>4.2</real>
</dict>
</plist>
```

```sh
$ curl -H "Accept: application/json" http://localhost:5000/configuration

{"Greeting":"Hello, World","Price":4.2,"FeatureXIsLaunched":true}
```
