# Cash Machine

A simple application that returns the least amount of bills for the required money

## Observations

### Why not Phyton?

I lack experience, not that it would stop me from making this application, but it wouldn't end up as clean.

### Why not Elixir?

Elixir would work very well with this application because of pattern matching and guards on function definition, which would be very handy on making my functions flexible and clear.
On the other hand, Elixir is not one of the main languages for this position, and I would need to implement my own `divmod()` equivalent, which is easy, but ugly and inefficient.

### Why ruby?

Ruby is simple, has `divmod()` and I can easily incorporate a test gem to what is basically a one-page script.

### Strategy

I used regex to clean up the input string, so I could separate the relevant part.

The core of my solution is `divmod()` which I used to count the necessary amount of bills for each kind.
I also implemented my own pluralize specifically for the word `nota`, that allowed me to make a very clean and readable method.

Then I checked whether there was any need to add an 'e ' on my response, and added if so.

## Getting Started

Here you will find instructions for installing and running this application

### Prerequisites

* [ruby-2.7](https://www.ruby-lang.org/en/documentation/installation/)
* [bundler-2.1.4](https://bundler.io/)

### Installing

Install gems

```shell
$ bundle install
```

### Using

Now just run cash_machine.rb!

You can use command line arguments to set required money:

```shell
$ ruby cash_machine.rb 'R$ 530,00'
Entregar 5 notas de R$ 100,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.
```

You can also just run the script without the argument, and then put the required money after being required to:

```shell
$ ruby cash_machine.rb
> Por favor, insira a quantidade de dinheiro desejada.
R$ 280,00
Entregar 2 notas de R$ 100,00 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.
```

### Testing

```shell
$ ruby -Ilib test/test_bill_picker.rb
Run options: --seed 60582
# Running:

........................

Finished in 0.002813s, 8532.6659 runs/s, 8532.6659 assertions/s.
24 runs, 24 assertions, 0 failures, 0 errors, 0 skips
```
