# ServiceInjector

A simple and lazy service injection gem. It's particularily useful when you don't have control over the creation of the object which depends on the services (Rails controllers, anyone?).

## Installation

Add this line to your application's Gemfile:

    gem 'service_injector'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install service_injector

## Usage

You can declaratively wire the dependencies:

    class BusinessLogic
      include ServiceInjector

      # Will create a :widget_repository protected method returning a memoized instance of WidgetRepository
      uses :widget_repository

      # Will create a :dingus_service protected method returning the memoized result of the given block
      uses :dingus_service do
        Some::Other::Service.new(value: 42, flag: true)
      end

      def do_something
        # ...
        widget = dingus_service.fetch_widget(id)
        widget_repository.store(widget)
        # ...
      end

    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/service_injector/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
