# HealthIQ
Design a simulator for daily blood sugar.

## Installation

This software requires that imagemagick be installed on your computer.

### Installation on OSX:

If you use Homebrew, then type:

    brew tap homebrew/versions
    brew install imagemagick@6
    PKG_CONFIG_PATH=/usr/local/opt/imagemagick@6/lib/pkgconfig gem install rmagick

Source:
https://stackoverflow.com/questions/9050419/cant-install-rmagick-2-13-1-cant-find-magickwand-h/18702042

### Installation on Ubuntu:

Type:

    sudo apt-get update
    sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev

Source:
https://github.com/rmagick/rmagick/wiki/Installing-on-Ubuntu


### Installing on Windows:

You can find instructions at https://github.com/rmagick/rmagick/wiki/Installing-on-Windows


## How to use

EXERCISE=tests/exercise.csv FOOD=tests/food.csv GRAPH=result.png rake simulator

where EXERCISE points to a comma-separated file with the time (in minutes) and exercise taken,
FOOD points to a comma-separated file with the time (in minutes) and food consumed,
and GRAPH (optional) points to where the output graph should be.

## Limitations

- Error-checking remains primitive.
- The program takes linear time on the (number of exercises or food) * time.
