iSee - NHS Hack Day Cardiff 2014
==========================

This repository contains source code for our implementation of eye tracking on a tablet. This was the winning entry for NHSHackday (Jan 2014) in Cardiff that spanned for two days. This application is aimed at kids for use in hospitals, to aid in carrying out acuity measurements. You can read more about the event [here](http://blogs.cardiff.ac.uk/development/2014/01/26/nhs-hack-day/)

*Note*: There is a vital part of this application missing, which are the Cardiff Cards assets. We could not include them for copyright reasons, so the build will fail quoting `Asset Catalogue Compiler Error` due to this.

![Photo of the eye tracking](http://farm3.staticflickr.com/2865/12158869143_fe4c2f8c5b_h.jpg)

Photo courtesy of Paul Clarke, more from the event [here](http://www.flickr.com/photos/paul_clarke/sets/72157640139264593/)

The iOS app uses a few open source componenets:
- [OpenCV](https://github.com/Itseez/opencv) For face and feature detection.
- [eyeLike](https://github.com/trishume/eyeLike) C++ project which we ported to iOS for accurate eye tracking, based on this [paper](http://www.inb.uni-luebeck.de/publikationen/pdfs/TiBa11b.pdf)

Contributors
==========================
 * [Tharshan Muthulingam](http://github.com/viperfx)
 * [Daniel Koehler](http://github.com/DanielKoehler)
 * [Mike Rhodes](http://github.com/mikerhodes)
