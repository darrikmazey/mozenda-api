# mozenda-api

*mozenda-api* is a ruby gem for interacting with [mozenda](https://www.mozenda.com/) via their [api](https://www.mozenda.com/api).

## Installation

Add this line to your application's Gemfile:

    gem 'mozenda-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mozenda-api

## Usage

*mozenda-api* requires a WebServiceKey to be configured.  The following code configures *mozenda-api* (*config/initializers* is a good place for this).

	Mozenda.configuration do |config|
		config.web_service_key = '01631847-1A39-2223-EDA3-3CADFE5899A2'
	end

To get a list of Collections:

	collections = Mozenda.collections

	collection = collections.first
		=> #<Mozenda::Collection:0x8d87040 @data={"CollectionID"=>13, "Name"=>"Some Collection", "Description"=>"This is a very important collection", "DefaultViewID"=>14, "AgentID"=>15}>

	collection.description
		=> "This is a very important collection"
	collection.id
		=> 13

To retrieve the views from a collection:

	views = collection.views

	view = views.first
		=> #<Mozenda::View:0x8c87f8c @data={"ViewID"=>14, "CollectionID"=>13, "Name"=>"All items", "Description"=>"All items in Some Collection"}>
	
	view.id
		=> 14
	view.name
		=> "All items"
	view.collection_id
		=> 13

To retrieve the items:

	items = view.items

	item = items.first
		=> #<Mozenda::Item:0x8ae30b4 @data={"ItemID"=>1000, "SomeField" => "Some Data"}>

**NOTE:** currently the *mozenda-api* gem will download ALL items, no matter how many pages.

Writing data to Mozenda is not currently supported.

## TODO
* Rate-limit *mozenda-api* to comply with the 30 requests-per-minute limit.
* Writing data back to mozenda
* per-page downloading of items

## License

This software is relased under the [MIT license](LICENSE.md).  Do your worst.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
