# How old am I?

**How old am I** is a simple script that returns the exact age you have.

It's purpose is to give you a feeling of how you're using (or wasting) your time on your computer.

This script is inspired from a MacOS app that does the exact same thing.

## How do I use the script?

The script is intended to be used on dynamic status bars (like dwm's)

By executing the script (using `./age.sh`) it will return the exact amount of years between the date you were born and now.
It uses bc to get more exact results with floating point math.

## Download

Simply download the script by using
```bash
git clone https://github.com/SowTag/how-old-am-i.git
```

or by copying it's source code in Raw mode.

## Usage

> Setting up your birthday

Go to line `3` and change your date accordingly within the double quotes.
For example, `March 4 1982`.

> Before executing

The script may not execute at first due to Linux permissions. Simply run
```bash
doas chmod +x ./age.sh
```
and the problem should be fixed.

## Usage example (with dwm + dwmblocks)

> This is a basic example on how to add the script to the status bar:

```c
 {"🕒 ", "echo \"$(sh ~/scripts/age.sh)\"", 1, 0}
```

This will update your age once each second.

## How do I adjust the output length?

Depends on how long do you want it to take to change.
You can change the amount of characters the script spits by going to the last line and replacing the substr() function.
The last parameter defines the output length.

For example, lets assume your age is 20.12345678987654321.

substr($0, 0, 5) -> 20.12 (5 characters)
substr($0, 0, 10) -> 20.1234567 (10 characters)

Here's a table to help you choose the output length:

| Output example | substr() value    | Length    | Time required to change |
|----------------|-------------------|-----------|-------------------------|
| 20.123456789   | Reference         | Reference | Reference               |
| 2              | substr($0, 0, 1)  | 1         | 10 years                |
| 20             | substr($0, 0, 2)  | 2         | 1 year                  |
| 20.            | substr($0, 0, 3)  | 3         | Never changes           |
| 20.1           | substr($0, 0, 4)  | 4         | 36.5 days               |
| 20.12          | substr($0, 0, 5)  | 5         | 3.65 days               |
| 20.123         | substr($0, 0, 6)  | 6         | 8.76 hours              |
| 20.1234        | substr($0, 0, 7)  | 7         | 52.56 minutes           |
| 20.12345       | substr($0, 0, 8)  | 8         | 5.256 minutes           |
| 20.123456      | substr($0, 0, 9)  | 9         | 31.5 seconds            |
| 20.1234567     | substr($0, 0, 10) | 10        | 3.1 seconds             |
| 20.12345678    | substr($0, 0, 11) | 11        | 315 milliseconds        |
| 20.123456789   | substr($0, 0, 12) | 12        | 31.5 milliseconds       |

The recommended length is 10 characters.
