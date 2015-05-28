boxcar\_publisher
=================

Installation
-----

```
gem install boxcar_publisher
```

Usage
-----

```
BoxcarPublisher.setup do |config|
  config.access_key 'THIS_IS_MY_ACCESS_KEY'
  config.secret_key 'THIS_IS_MY_SECRET_KEY'
end

push = BoxcarPublisher::Push.new aps: { alert: 'Hello world' }, tags: ['@all'], id: '12345'
push.id
# => 12345
push.state
# => {:state=>"delivered", :created_at=>2015-05-27 22:28:10 -0700, :last_delivered_at=>2015-05-27 22:28:10 -0700, :sent=>1, :errors=>0, :opened=>0}
```
