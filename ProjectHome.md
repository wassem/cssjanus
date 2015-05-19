CSSJanus is CSS parser utility designed to aid the conversion of a website's
layout from left-to-right(LTR) to right-to-left(RTL). The script was born out of
a need to convert CSS for RTL languages when tables are not being used for layout (since tables will automatically reorder TD's in RTL).
CSSJanus will change most of the obvious CSS property names and their values as
well as some not-so-obvious ones (cursor, background-position %, etc...).
The script is designed to offer flexibility to account for cases when you do
not want to change certain rules which exist to account for bidirectional text
display bugs, as well as situations where you may or may not want to flip annotations inside of the background url string.

CSSJanus itself is not always enough to make a website that works in a LTR
language context work in a RTL language all the way, but it is a start.

Check out a running django-ified webapp version: http://cssjanus.commoner.com/

Read the blog post and watch the demo video: http://google-opensource.blogspot.com/2008/03/cssjanus-helping-i18n-and-ltr-to-rtl.html

Also, for the greatest detail of what gets flipped in CSS Janus, please have a look at the unit test: http://code.google.com/p/cssjanus/source/browse/trunk/cssjanus_test.py