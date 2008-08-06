= EsvBible

* Wrapper for English Standard Version (ESV) Bible Web Service

== DESCRIPTION:

See ESV API docs http://www.esvapi.org/

== FEATURES/PROBLEMS:

* FIX (list of features or problems)

== SYNOPSIS:

  bible = EsvBible.new('YOUR API KEY HERE')

  verse   = bible.verse   'Gen 1:1'
  passage = bible.passage 'Gen 1'
  
  verse   = bible.verse   'John 1:1', {:output_format => :text, :include_headings => false}

== REQUIREMENTS:

* rspec - for testing

== INSTALL:

* sudo gem install esvbible

source is hosted at https://github.com/gdagley/esv_bible

== LICENSE:

The MIT License

Copyright (c) 2008 Geoffrey Dagley

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
