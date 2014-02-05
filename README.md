# TFL status

This is a very basic TFL status checker, written in Ruby. It utilises the [TubeUpdates API](http://tubeupdates.com/documentation/)
to fetch up to date line status information. The CLI components are built with [Thor](http://whatisthor.com/), and the output is
somewhat aided by the [Colorize](https://github.com/fazibear/colorize) gem. It is designed to mimic the
[TFL service updates](http://www.tfl.gov.uk/) widgit.

## Running

You can simple execute the application by running `./bin/tfl-status`. Alternatively, build a gem, and install it; assuming the gem
executable directory is in your path, you can simple run `tfl-status`. If you wish to check an individual line, run
`tfl-status check <line>` -- for example, `tfl-status check bakerloo`.

## Output

The application just outputs line statuses at the moment; it does not display information about the disruption. The colours in the
output are constrained by what is available in your terminal. The closest applicable colours have been chosen, some cases will appear
a little "off". Please also note that terminal emulators often allow you to adjust the colour profile, deviating away from the
"correct" colours -- this may mean your output doesn't look quite right.

## Screenshot

![Screenshot](http://i.imgur.com/dfdKhtw.png)
