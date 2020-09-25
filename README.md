# TestRailsGem
Try to build rails gem

https://guides.rubyonrails.org/plugins.html

## Usage
* Generate scaffold

  ```bash
  bin/rails g scaffold Book name:string author:string description:text
  ```

* Setup in model
  * {Rails.root}/app/models/application_record.rb

    ```ruby
    class ApplicationRecord < ActiveRecord::Base
      include TestRailsGem::ActsAsGem
      self.abstract_class = true
    end
    ```

  * {Rails.root}/app/models/book.rb

    ```ruby
    class Book < ApplicationRecord
      # Setup field name, default is :last_squawk
      acts_as_gem gem_text_field: :name
    end
    ```

* Use in controller
  * {Rails.root}/app/controllers/books_controller.rb

    ```ruby
    class BooksController < ApplicationController
    # POST /books
    # POST /books.json
    def create
      @book = Book.new(book_params)
      @book.squawk @book.name

      respond_to do |format|
        if @book.save
          format.html { redirect_to @book, notice: 'Book was successfully created.' }
          format.json { render :show, status: :created, location: @book }
        else
          format.html { render :new }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
    ```

* Result

  ```ruby
  $ rails console
  pry (main) > @book = Book.new
  pry (main) > @book.name, @book.author = "Tag", "Charlie"
  => ["Tag", "Charlie"]
  pry (main) > @book.squawk @book.name
  => "squawk! Tag"
  pry (main) > @book.save
  => (5.5ms)  BEGIN
  => ook Create (2.4ms)  INSERT INTO `books` (`name`, `author`, `created_at`, `updated_at`) VALUES ('squawk! Tag', 'Charlie', '2020-09-25 02:41:13.225655', '2020-09-25 02:41:13.225655')
  => 8.2ms)  COMMIT
  pry (main) > "#{Book.last.name}, #{Book.last.author}"
  => "squawk! Tag, Charlie"
  ```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'test_rails_gem'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install test_rails_gem
```

## Contributing
Just fork and pull request

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Changelog
* https://github.com/charlietag/test_rails_gem/compare/v0.0.0...v0.0.1
  * add basic String ext to_squawk
* https://github.com/charlietag/test_rails_gem/compare/v0.0.1...v0.0.2
  * Add an "acts_as" Method to Active Record
    * 4.1 Add a Class Method
* https://github.com/charlietag/test_rails_gem/compare/v0.0.2...v0.0.3
  * Add an "acts_as" Method to Active Record
    * 4.2 Add an Instance Method
