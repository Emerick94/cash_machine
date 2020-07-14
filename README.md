# Cash_machine
a simple application that returns the least amount of bills for the required money

## Prerequisites

* [ruby-2.7](https://www.ruby-lang.org/en/documentation/installation/)
* [bundler-2.1.4](https://bundler.io/)

### Installing

install gems

```shell
$ bundle install
```

## Using

Now just run cash_machine.rb!

You can use command line arguments to set required money:

```shell
$ ruby cash_machine.rb 'R$ 530,00'
Entregar 5 notas de R$ 100,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.
```

You can also just run the script without the argument, and then put the required money

```shell
$ ruby cash_machine.rb
> Por favor, insira a quantidade de dinheiro desejada.
R$ 280,00
Entregar 2 notas de R$ 100,00 1 nota de R$ 50,00 1 nota de R$ 20,00 e 1 nota de R$ 10,00.
```

## Testing

```shell
$ ruby -Ilib test/test_bill_picker.rb
Run options: --seed 60582
# Running:

........................

Finished in 0.002813s, 8532.6659 runs/s, 8532.6659 assertions/s.
24 runs, 24 assertions, 0 failures, 0 errors, 0 skips
```
