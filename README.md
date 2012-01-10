Api Spec
========

A collection of RSpec matchers to make testing JSON API easy.

Install
-------

Usage
-----

First you need to require api_spec in your spec_helper.rb:

```
  require 'api_spec'
```

You will then need to include ApiSpec::Matchers in your example groups.
If you want to have access to the helpers and matchers in all of your examples you can do the following in your spec_helper.rb:

```
Spec::Runner.configure do |config|
  config.include(ApiSpec::Matchers)
end
```

Otherwise, you will need to include them in the example groups you wish to use them:

```
describe "TicketsController" do
  include ApiSpec::Matchers
  ...
end
```

ApiSpec::Matchers are created to be used in testing JSON responses
generated by rails in RSpec controller specs. So you need to call
`render_views` in your controller spec file.

```
describe TicketsController do
  render_views
  ...
end
```

Now you can use the matchers on the `response` object

```
it "should respond with status 200" do
  get :index
  response.should have_status(200)
end
```

Matchers
--------

### have_status
```response.should have_status(200)```

### have_content_type
```response.should have_content_type(:json)```

### have_api_key

Consider JSON API output:

```
 {
  'count'  : 1,
  'ticket' : {
    subject : 'Hai',
    attachments : [
      { 'id' : 1 },
      { 'id' : 2 }
    ]
  }
 }
```

You can check the existence of a top level api key like `count` using: 

```
response.should have_api_key('count')
```

You can check the existence of an inner key like `subject` using the `.`:

```
response.should have_api_key('ticket.subject')
```

You can check the existence of a key in an array like `id` of
`attachments` using:

```
response.should have_api_key('ticket.attachments.0.id')
response.should have_api_key('ticket.attachments.1.id')
```

#### with_value
The ApiSpec::Matchers allows you to check value of a key using:

```
response.should have_api_key('count').with_value(1)
```

#### with_length
You can also check the length of key containing an array using:

```
response.should have_api_key('ticket.attachments').with_length(2)
```
