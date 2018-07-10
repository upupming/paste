# A proposal to make contributions to JabRef 

July 9, 2018

Team members: 

|Name|Student ID|
|:--:|:--:|
|崔路源|1163300402|
|赵天宇|1150340105|
|孙月晴|1160300901|
|姜梦奇|1160300906|
|高靖龙|1161000309|
|李一鸣|1160300625| 

## Introduction

JabRef(www.jabref.org) is a reference management software that uses BibTeX and BibLaTeX as its native formats and is therefore typically used for LaTeX. JabRef provides an interface for editing BibTeX files, for importing data from online scientific databases, and for managing and searching BibTeX files. JabRef is licensed under the terms of MIT license since version 3.6(and was under the GPL license before). JabRef is written in Java and initially released on November 29, 2003. The latest stable release is 4.3.1(54 MB) released on June 5, 2008. In order to gain experience in group-based software development, we are going to make some significant contribution to this project. 

In [contribution FAQ](http://help.jabref.org/en/FAQcontributing), we find that there are many aspects that can be improved. One basic way is to start from "good first issue".

Here we have picked four issues.

## Issue 4159: Disabled Entry preview still shows up

### What to contribute

The "entry preview" has a bug.

|![](https://raw.githubusercontent.com/upupming/paste/master/img/20180710115259.png)|<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710115712.png"/>|
|:--:|:--:|
|When "View -> Toggle entry preview" is selected, the entry preview in the bottom shows properly.|If I deselect the "View -> Toggle entry preview", the entry preview in the bottom will disappear.|

|<img src="https://raw.githubusercontent.com/upupming/paste/master/img/Selection_006.png"/>|<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710120132.png"/>|
|:--:|:--:|
|JabRef 4.3.1 <br> Linux 4.15.0-24-generic amd64 <br> Java 1.8.0_172 <br><hr> However, when I select another entry, the bug comes out. The entry preview shows when "View -> Toggle entry preview" is not selected.|JabRef 4.3.1 <br> Windows 10 10.0 amd64 <br> Java 1.8.0_172 <br><hr> After deselecting, there will be no entry preview any more no matter whether the "View -> Toggle entry preview" is selected or not.|

Other views may have similar bugs, and we will fix them together.

### Steps to get a contribution accepted

It seems it is a platform-specified issue. We will try to reproduce and fix this bug on all platforms. Then we will review our code quality and make sure no other bugs are introduced. We will add Junit test to this view menu, too. 

## Issue 4166: Entry editor: simultaneous moving and renaming of document file?

### What to contribute

<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710212941.png"/>

ilippert says: 

> Jabref allows automatic renaming, e.g. using the bibtex citekey as a the filename.

> In the current version, I can first use drag&drop to include a local link to the entry's file. then I can right-click and move it to the preferred document folder. and then I can right click (onto the file) again to rename the file (automatically, in my case the bibtex cite key).

> I would hope the context menu/right click changes the "move" interaction, maybe with a simple checkbox "do you want the file to be renamed automatically?", and then simultaneously moves and renames the file automatically.

### Steps to get a contribution accepted

Before getting started, we will communicate with JabRef developers in time to ask where improvements are still needed. Actually we have done this and @tobiasdiez says:

> I would simply add a "Move and rename" action in the right-click menu. Should be easiest solution.

First, determine where to start the modifying.

Then, implement specific code logic.

Finally, do multiple unit tests.

## Issue 3823: File annotations: remove line breaks, increase width, and reduce font size

### What to contribute

The contribution we are planing to make is about file annotations, including 

**removing line breaks**, 

|pdf file|line breaks incorrectly recognized as carriage return |
|:-:|:-:|
|<img src=https://user-images.githubusercontent.com/3094352/37212695-a907ab08-23a7-11e8-91e1-22c0ece31939.png>|<img src=https://user-images.githubusercontent.com/3094352/37212696-a9371f6e-23a7-11e8-8a15-455fb09c3b2f.png>|

**increasing width**,

@anassal says:

> There is currently a wide white space between the annotation text and the date/page number. Text should be warped with the maximum available/appropriate width.

and

**reducing font size**. 

@anassal says:

> I suggest the font size of the extracted annotations in the left-hand panel be reduced (e.g., x0.6). The right hand panel font size looks OK.


Also, there is currently a wide white space between the annotation text and the date/page number. Text should be warped with the maximum available/appropriate width. 

Then, the height of each annotation item should be "auto".

### Steps to get a contribution accepted

First, we need to understand why the formatting issue exits.

Then, we will read the source code and enhance the formatting.

Maybe there are many other aspects we can improve, too. We will try to figure all of them out.

## Issue 3599: Disable extended help in the search field

|The message comes out after hitting "Enter" with blank input, for just 1 second|We should delete this message|
|:-:|:--:|
|<img src=https://raw.githubusercontent.com/upupming/paste/master/oss/3599.gif>|<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710215904.png"/>|

### What to contribute

We are planning to remove the function that **an extended help window** appears telling user that it would be possible to modify his or her search expression. 

This is rather boring when using a large database. this warning message can be completely removed.

More experienced users will not need it. Less experienced users may have a look at the documentation or even proceed by trial and error.


### Steps to get a contribution accepted

1. Understand the file structure to find the code part that associate with this function.
2. Desigh tests based on Junit 5
3. Change code and make regression testing.

## Challenges to be encountered

In order to complete the task, our biggest challenge is to read the source code and understand the file structure and the code function. We can even help with their comments because now most of the code is not commented. And there are different behaviors on each platform, we have test them all.

## Timeline of our plan

Our timelime is heavily relied on our actual progress. We promise to accompolish the first two issues, and we will continue with another two issues if we have ample time. Our ideal schedule is following:

<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710223235.png"/>

## References

1. [Jabref (Reference Manager) for Latex Quick Start Tutorial](https://www.youtube.com/watch?v=qTJaQWSNibU)
2. [Disabled Entry preview still shows up · Issue #4159 · JabRef/jabref](https://github.com/JabRef/jabref/issues/4159)
3. [Entry editor: simultaneous moving and renaming of document file? · Issue #4166 · JabRef/jabref](https://github.com/JabRef/jabref/issues/4166)
4. [File annotations: remove line breaks, increase width, and reduce font size · Issue #3823 · JabRef/jabref](https://github.com/JabRef/jabref/issues/3823)
5. [Disable extended help in the search field · Issue #3599 · JabRef/jabref](https://github.com/JabRef/jabref/issues/3599)