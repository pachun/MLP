# major league pong

![travis-ci](https://magnum.travis-ci.com/pachun/mlp.svg?token=WjyFGab17xpyVMWUGqUg&branch=master)
[![Code Climate](https://codeclimate.com/repos/553868446956805975001e5d/badges/8763bd12fbab40db3547/gpa.svg)](https://codeclimate.com/repos/553868446956805975001e5d/feed)

###onboard

* install rubymotion
* `git clone git@github.com:pachun/mlp.git`
* `cd mlp`
* `sudo motion update --cache-version=3.13`
	* this version number is duplicated in Rakefile and .travis.yml
* `bundle install`

###run the tests

```
bundle exec rake spec
```
###simulate the app
```
bundle exec rake
```
###run the app on a device
* email __nick@pachulski.me__ with your device's UDID and the type of device
* attach the device to your mac with a lightning cable
* eject the device through iTunes and Xcode if either indicates they're connected to the device
* `bundle exec rake device`
