# TaxCalculator

Calculates tax given a receipt of items.

## Installation
You can run `bin/setup` to install dependencies.

## Usage

The main CLI executable to run the program is located at: `exe/tax_calculator`. This CLI can take either a path to a text file or via executing the CLI with no args, pasting in the input and then running CTRL-D to indicate an EOF.

After running installation (`bin/setup`):
`cd tax_calculator`
`./exe/tax_calculator /path/to/item_list_file.txt`

## Development

Run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.