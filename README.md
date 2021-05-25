# tycs
Teach Yourself CS

Learning CS through the https://teachyourselfcs.com method.

## Programming

### Brian Harvey’s Berkeley CS 61A

#### Material
Lectures - https://archive.org/details/ucberkeley-webcast-PL3E89002AA9B9879E?sort=titleSorter  
Book - https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book.html  
Syllabus - https://wla.berkeley.edu/~cs61a/sp11/0.pdf  
UCB Scheme - https://inst.eecs.berkeley.edu/~scheme/  
Homework - http://wla.berkeley.edu/~cs61a/reader/nodate-hw.pdf  
Labs - http://wla.berkeley.edu/~cs61a/reader/nodate-labs.pdf  
Projects - http://wla.berkeley.edu/~cs61a/reader/vol1.html  
Exams - http://wla.berkeley.edu/~cs61a/reader/vol2.html  
Lecture Notes - http://www-inst.eecs.berkeley.edu/~cs61a/reader/notes.pdf  

#### Setup UCB Scheme (on Mac)
Install using link above.  
Install XQuartz to get X11 (search 'x11 on mac').  
Run stk-simply in Terminal.  

#### Common Issues
If running stk-simply in the Terminal is producing an error (Bad CPU type), your mac is probably newer since stk scheme is not supported on the newer MacOS

As an alternative suggestive by Brian Harvey in the comments of the first lecture on archive.org (link to lectures above, find lecture 1)

>About the software: Your best bet these days might be to use the simply-scheme package in Racket as another commenter suggests below. STk still works for me, but I'm only on MacOS 10.13; I know everything will break if I ever have to replace my Mac with a new one.

DrRacket Installation - https://download.racket-lang.org/.  
DrRacket Docs - https://docs.racket-lang.org/pollen/Installation.html.  

Once DrRacket is installed, follow the instructions within docs (1.2 How to Install) for updating the PATH environment variable on your respective OS. 
After the path is updated, run the following command in the Terminal: 
```
raco pkg install simply-scheme
```
Finally, open DrRacket to run the following in the top editor:
```
#lang simply-scheme
```

You are now ready to tackle the best computer programming book ever written!
