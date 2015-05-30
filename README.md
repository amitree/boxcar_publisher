boxcar\_publisher
=================

A simple Ruby interface to the [Boxcar Push API](http://developer.boxcar.io/api/publisher/).

Installation
-----

```ruby
gem install boxcar_publisher
```

Usage
-----

```ruby
BoxcarPublisher.setup do |config|
  config.access_key 'THIS_IS_MY_ACCESS_KEY'
  config.secret_key 'THIS_IS_MY_SECRET_KEY'
end

# Create a new push notification (POST /api/push)
# Returns a BoxcarPublisher::Push instance
push = BoxcarPublisher::Push.new aps: { alert: 'Hello world' }, tags: ['@all'], id: '12345'
# => #<BoxcarPublisher::Push:0x007f8491892ea8 @id="472317", @url="http://boxcar-api.io/api/push/472317">
push.id
# => 12345

# Get the state of an existing push (GET /api/push/{id})
# Returns a hash with the current state of the push
push.state
# => {:state=>"delivered", :created_at=>2015-05-27 22:28:10 -0700, :last_delivered_at=>2015-05-27 22:28:10 -0700, :sent=>1, :errors=>0, :opened=>0}

# Delete a queued push (DELETE /api/push/{id})
# Returns nil on success; raises an error on failure
push.delete
# => nil
```
