= caculo

* http://caculo.cohitre.com


== The Succinct Summary:

Caculo lets you simulate interaction with a browser via Ruby. It has the option to load a Javascript Library and call Javascript functions on the document. This allows for simple code that takes advantage of exisiting libraries.

Caculo is inspired by the Watir/FireWatir/SafariWatir trio, However, by simplifying the way of communicating with the browser it tries to offer an integrated cross-browser solution. It also extends the Test/Unit framework to provide some abbreviations to common functions.


== The Polite Apology

I haven't really tested Caculo outside of my computer, so things may not work as expected out of the box. 

== The Descriptive Example:

   browser = Caculo.open :safari
   browser.libraries = [:jquery]

   browser.visit( 'http://google.com' )

   browser["input[@name='q']"].val! 'cohitre'
   browser["form[@name='f']"].submit!

   browser.wait
   browser.load_libraries

   browser.visit browser['#res .g:eq(1) h2.r a'].attr('href').execute


== The Required Requirements

For testing in Firefox you will need the JSSh plugin. After the plugin has been installed and turned on, you need to call firefox with:

$ firefox -jssh

For testing in Safari you will need rbosa. It is available through rubygems, so it should be enough to write:

$ sudo gem install rubyosa


== The Daunting Installation:

$ gem install caculo


== The Permissive License

(The MIT License)

Copyright (c) 2008 Carlos Rodriguez

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.