# vim-actodo

This is a very basic TODO list syntax plugin. There are no fancy keybindings,
and nothing automatic. It simply formats a TODO list to make it easier to track
what you are working on.

## Supported keywords

Lines beginning with `#` will be shown in bold and should be used as headers.
You can use multiple hash characters for different levels but they will all be
formatted the same. Leading whitespace is ignored.

Lines beginning with `TODO:`, `WORK:` (for work-in-progress), or `DONE:` are
your tasks, with the associated status. The keywords will be coloured red,
green, and grey respectively, but the rest of the line will be shown normally.

URLs enclosed with angled brackets will be shown in blue, as will dates in a
subset of the ISO 8601 format (`YYYY-mm-dd`, `YYYY-mm-ddTHH:MM`, and `THH:MM`,
with or without a trailing `Z`).

Any other lines will be shown in plain text, and are designed for notes or
comments on the tasks.

## Example

This is an example TODO list, and a screenshot of how it is displayed. The file
should have the extension `.actodo`.

    Projects
    ========


    # Office party

            TODO: Buy snacks.

                    James is allergic to peanuts.

                    Beth doesn't like seafood.

            WORK: Decorate the hall.

                    Bouncy castle will be delivered at T09:30.

            WORK: Sell raffle tickets.

                    Also online at <https://example.com/raffle>.

            DONE: Put up posters.

            DONE: Book Ceilidh dance tutor.


    ## After-party

            TODO: Find a jazz band.


![Screenshot of an example list](screenshot.png)
