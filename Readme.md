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
