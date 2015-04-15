### This app *is* already usable but does *not* have all the intended functionality described below

After so much trying and failing to meditate, I thought to myself, "What if I
could completely defeat the point of all this?"

My problem is that I set a timer for 5 minutes, then I'll start trying to
clear my mind, and then before I know it, I've become complete distracted, and
I don't even realize until either I do realize, or the 5 minutes is up,
whichever is first, which is usually (sadly) the latter.

So I would like to make an app for that.

It has a `bellInterval` which starts at (configurable) 15 seconds. It dings in
the beginning of the interval and at the end. Then there is a (say) 5 second
in-between time during which you can click "succeeded", or "unsucceeded". If
you hit "succeeded", then the `bellInterval` *slightly increases* to
(configurable) 15% increase. Similarly, hitting "unsucceeded" brings you to 15%
decrease (I know...you won't end up where you started, blaah).

You can also simply "try again" during the execution of a single interval.

When you "end" your session, it displays for you and saves a log of

    Start time
    End time
    Total time
    Success time
    Fail time
    Successes
    Fails
    Longest success

Now (*'eventually'*) graphs of these different fields can be plotted.

Looking online, I see I'm not the first person to think of this. But there's no
app that does exactly like I want...so it shouldn't be too hard to make.
