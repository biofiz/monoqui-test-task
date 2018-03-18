## TEST TASK (KATA09)

1. Run irb console in project directory using command:
```bush
  irb -I .
```

2. Require the file in console:
```ruby
  require 'checkout'
```

3. Run one by one this commands
```ruby
  rules = { A: SpecialCalculationRule.new(50, 3, 130), B: SpecialCalculationRule.new(30, 2, 45), C: BaseCalculationRule.new(20), D: BaseCalculationRule.new(15) }
  
  co = Checkout.new(rules)
  
  co.scan('D')
  co.scan('A')
  co.scan('B')
  co.scan('A')
  co.scan('B')
  co.scan('A')
  
  co.total
```
You will get 190.

3. For testing, install gem RSpec
```bush
  bundle install
```
Then run tests
```bush
  rspec spec
```

### Implementation considerations

In my solution I used approach with classes: `BaseCalculationRule` and `SpecialCalculationRule`. `BaseCalculationRule` uses simple logic for coast calculation, just price * amount. `SpecialCalculationRule` is a child class with extended calculation logic. This approach allows us add additional rules easily.
In my solution I used base OOP principles (such as inheritance) and used dependency injection in `Checkout` class. It gives us flexibility, so that we can add a new rule to any product easily, as soon as any Rule class implements the `cost` method.
