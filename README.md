# Cowerpoint

A presentation shell script, for viewing text slides using cowsay.

## Usage

    $ cowerpoint <your slides directory>

Cowerpoint listens for the following keypresses:

* `j` or `n` - Jump to the next slide
* `k` or `p` - Jump to the previous slide
* `q` - Exit Cowerpoint
* Basically anything else - Jump to the next slide

## Slide format

The format of the slides is very simple.

The first line is a list of options for cowsay.
The rest of the file is your verbatim slide.

Here is an example (example.slide in this repo):

    -f tux
    This slide will result in piping this command to `cowsay -n -f tux`

The output looks like this:

    $ ./cowerpoint.sh example.slide
     _______________________________________
    / This slide will result in piping this \
    \ command to `cowsay -f tux`            /
     ---------------------------------------
       \
        \
            .--.
           |o_o |
           |:_/ |
          //   \ \
         (|     | )
        /'\_   _/`\
        \___)=(___/

## Installation

Just clone this repo and put the `cowerpoint.sh` somewhere in your
`PATH`.
