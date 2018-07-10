1. Which project to contribute to?
2. What contribution to make?
3. What will I need to do in order to get a contribution accepted?

    + Add features.
    + Add tests.
    + Peer review.
    + Test

4. What challenges do I expect to encounter?
5. What's my timeline?

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

### Challenges to be encountered

In order to complete the task, our biggest challenge is to read the source code and find the root of this bug. And why there are different behaviors on each platform.

## Timeline of our plan

## References

1. [Jabref (Reference Manager) for Latex Quick Start Tutorial](https://www.youtube.com/watch?v=qTJaQWSNibU)
2. [Disabled Entry preview still shows up · Issue #4159 · JabRef/jabref](https://github.com/JabRef/jabref/issues/4159)

