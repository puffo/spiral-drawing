# spiral-drawing

An example solution for printing out a spiral shape via the console.

Uses Ruby 2.3.8.

## Getting up and running

If you're feeling lazy, and would just like to see a bunch of different spirals:
```
ruby demo_spirals.rb
```

Otherwise, to add the spirals to your project, instantiate a spiral like so:
```
$ require './spiral.rb' #=> true
$ Spiral.call(size: 5)
```


### Running tests

Assuming your Ruby environment is setup correctly, simply add minitest:

```
gem install minitest
```

and run these commands:

```bash
ruby test/canvas_test.rb
ruby test/spiral_test.rb
```
