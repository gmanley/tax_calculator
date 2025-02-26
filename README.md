# TaxCalculator

Calculates tax given a receipt of items.

### NOTE:
There are some definite assumptions on how items are categorized. For now food is anything with: chocolate(s) or apple(s) in the name, medicine is anything with pill(s) or insulin in the name and books are anything with book(s) in the name. As is, the code can be pretty easily modified to add more regex patterns to that list and I have thoughts on how one may change the code to fit a more real world use case.

There is also one spec failing, where I belive one example input and output given in the instructions has incorrect calculations. Certainly ready to discuss that.

## Installation
You can run `bin/setup` to install dependencies.

## Usage

The main CLI executable to run the program is located at: `exe/tax_calculator`. This CLI can take either a path to a text file or via executing the CLI with no args, pasting in the input and then running CTRL-D to indicate an EOF.

### Example
After running installation (`bin/setup`):

`cd tax_calculator`

`exe/tax_calculator spec/fixtures/input1.txt`

## Development

Run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.