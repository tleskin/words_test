## Words Test

This is a code exercise for [Hello Labs](http://www.hellolabs.com). It takes in a dictionary, finds the different four letter sequences for the words and returns output files with the words and sequences.

After downloading, please run: `bundle install`.

##### Running the program

To run, from the terminal run:

`ruby runner.rb`

If you want to specify the dictionary as well as the output files for the words
and sequences, from the terminal run:

`ruby runner.rb path/dictonary.txt path/words.txt path/sequences.txt`

##### Running the test suite

There is a full test suite for the exercise written with MiniTest. To run the
test suite, from the terminal run:

`rake test`

#### Information about the exercise

Write a program which, given a dictionary, generates two
output files, 'sequences' and 'words'.  'sequences' should
contain every sequence of four letters (A-z) that appears in exactly
one word of the dictionary, one sequence per line.  'words'
should contain the corresponding words that contain the
sequences, in the same order, again one per line.

For example, given the trivial dictionary containing only

```
arrows
carrots
give
me
```

The outputs should be:

```
'sequences'             'words'

carr                    carrots
give                    give
rots                    carrots
rows                    arrows
rrot                    carrots
rrow                    arrows
```

Of course, 'arro' does not appear in the output, since it is
found in more than one word.

For the final solution, read in the following dictionary file: http://bit.ly/1jveLkY
