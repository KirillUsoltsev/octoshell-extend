# Bootstrap

## Install PostgreSQL 9 and setup db

~~~
createdb octoshell_developement
createuser octoshell
~~~

## Install rvm and ruby

<https://rvm.io/rvm/install/>

~~~
rvm install 1.9.3
~~~

## Clone Project

~~~
git clone git@github.com:evrone/octoshell-extend.git
~~~

## Install gems

~~~
cd octoshell-extend
bundle
~~~

## Start

### Testing procedures

~~~bash
irb -I.
require 'init'
procedure = AddUser.new(task)
procedure.perform 
~~~

For add new procedure you should add `new_procedure.rb` file to `app/procedures` with the following code:

~~~ruby
class NewProcedure < Procedure
  def perform
    # executed code here
  end
end
~~~

`perform` method should return a boolean result.

### Testing helper scripts

~~~bash
unicorn
open http://0.0.0.0:8080
~~~

For add new helper you should add `new_script.rb` file to `app/scripts` with the following code:

~~~ruby
class NewScript
  attr_reader :result
  
  def run
    # get result
    @result = "255 Tb"
  end
end
~~~

Class should respond to `run` method.

Slim users for create js and html. [About slim](http://slim-lang.com)

Then add a view file to `app/views/new_script.slim`.

In `new_script.slim` you will have a `@script` variable.

~~~erb
$("#extend").html("Free space: <%= @script.result %>");
~~~

**Output file will be a javascript.**

You can also use partials:

First you should add a new partial to `app/views/partials/your_partial.slim` and render it in `new_script.slim`.

h4 Partial:

~~~slim
div class="extend"
  = hello

table class="table table-bordered"
  tr
    th Foo
    th Bar
  - items.each do |item|
    tr
      td = item
      td = item
~~~

h4 Template:

~~~slim
- template = slim(:'partials/example', locals: { items: [1,2,3], hello: @script.result })
| $("#extend").html('#{{template}}');
~~~

In your `new_script.erb` will render created template and use it.

~~~erb
var partial = _.template('<%= erb :'partials/your_partial' %>');
$("#extend").html(partial({ hello: '<%= @script.result %>' }));
~~~

### Deploy

~~~bash
cap deploy
~~~
