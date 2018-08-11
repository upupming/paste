## Understanding of the contribution process to Open Source Software projects

# Our accepted contribution

## Material covered in this course

<hr>  

**李一鸣**

In the last month, we have focused on three issues(#4166, #4159, and #3823) of JabRef. We participate in the discussion and made contributions to JabRef and closed these issues. Fortunately, the tasks we completed were exactly in the order of easy to difficult. We will explain:

1. what we have we contributed
2. what we have learned about contribution process

# What we have contributed

## Issue 4159: Disabled Entry preview still shows up

<details>

When the "View -> Toggle entry preview" is selected, the entry preview in the bottom shows properly. If We deselect the "View -> Toggle entry preview", the entry preview in the bottom will disappear. However, when We select another entry, the bug comes out. The entry preview shows when "View -> Toggle entry preview" is not selected.

![](https://raw.githubusercontent.com/upupming/paste/master/img/20180710115259.png)
<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180710115712.png"/>
<img src="https://raw.githubusercontent.com/upupming/paste/master/img/Selection_006.png"/>

This issue is opened by @mcspritz and found on JabRef 4.3.1, Linux 4.14.48-2-manjaro amd64, Java 1.8.0_172. In the beginning, we test it on JabRef 4.3.1 and reproduced it. We also found another problem that on Windows once the option is deselected, the preview will not show anymore no matter the option is selected or not in the further. Finally, we knew it's actually minimized at the bottom and the window is still there! 

<hr>

**孙月晴**

After reading the contribution guide, we begin to test the latest build at http://builds.jabref.org/master/ , we found that the UI has changed a lot and the issue does not exist at all!

![selection_007](https://user-images.githubusercontent.com/24741764/42815066-d3fe836a-89f8-11e8-9459-a242367d10dd.png)

We tested on 9b2fedc-"Adapt test to https" (the branch point of master branch and v4.x branch), the bug exists there. This bug disappeared after the three commits following the branch point of the master and v4.x branch. This is because a989aa4-"merge from maintable-beta branch" changed the GUI a lot.

<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180808212611.png"/>
<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180808212427.png"/>


At first, we don't know the branches and versions of JabRef very much. So we ask a question on gitter:

<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180808211629.png"/>


So now that the issue is fixed in the developing builds, we don't need to do anything. We just report on the issue and then JabRef administrator closed this issue.
</details>


<hr>

**高靖龙**

## Issue 4166: Move & remove file simultaneously

<details>

There is a rename option and a move file to default directory option in the right-click menu of file item.

<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180808214628.png"/>

So our purpose is to simplify the process of this two operation. We tried to add a "move and rename" option on the right click menu.

We just reused the existed method and integrated the two methods into a new one method and add it to the event listener.

```java
public void moveToDefaultDirectoryAndRename() {
    moveToDefaultDirectory();
    rename();
}
```

```java
renameAndMoveFile.setOnAction(event -> linkedFile.moveToDefaultDirectoryAndRename());
```

Although it works like a charm, the member of JabRef project made another optimization: they remove the confirm dialog because user always wants to agree the two operations simultaneously.

</details>

<hr>

**崔路源**

## Issue 3823: file annotation

<details>

@anssal suggested that the redundant hyphens and line-breaks came from PDF files in the marking content should be removed. He also suggests the font size and margin should be refined.

After discussion, we thought if the line breaks are for another paragraph, for example:

![image](https://user-images.githubusercontent.com/24741764/43352436-fa0d1020-9255-11e8-9fef-6e27e24834d7.png)

![image](https://user-images.githubusercontent.com/24741764/43352432-e4795638-9255-11e8-88f3-7eec9584d6de.png)

Line break at Location 1 should be deleted, but that at location 2 should be reserved.

We tried to find a solution to judge if the line break should be removed. After reading the code of the JabRef, we found two classes used to remove hyphens and line-breaks and generate the bibtex key (and file name). We just reused the logic and changed them for our usage. We used regular expression `(?<![.|:])%n` for wisely judging a line-break should be removed or not -- We removed all new lines which don't have preceded `.` or `:` because we think `.` or `:` is often used to start a new paragraph.

Actually, the existed logic helped us a lot, but @tobiasdiez said that we should not change the existed logic because they have their own usefulness. So finally we kept the two classes untouched and adapted the new pattern only in our marking content.

<hr>

**赵天宇**

Beside this, we also wrapped the summary content for the better margin between page/date notation and fixed the tooltip width and font size.

**Before**
<img src="https://user-images.githubusercontent.com/24741764/43352522-4e817424-9257-11e8-865a-a188d2f31cc9.gif">

**Margin fixed**
<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180803091540.png"/>

**Tooltip fixed**
<img src="https://raw.githubusercontent.com/upupming/paste/master/img/20180803092209.png"/>

Finally, we added JUnit test for our own hyphens and line-breaks remover, this is our test case:

**Before removing**
```
This is paragraph 1.
This is paragr-
aph 2, and it crosses
several lines,
now you can see next paragraph:
This is paragraph%n3.
```

**After removed**
```
This is paragraph 1.
This is paragraph 2, and it crosses several lines, now you can see next paragraph:
This is paragraph 3.
```

</details>

<hr>

**姜梦奇**

# What we have learned

0. Comment on the issue, make sure you understand what others mean and propose what you are going to do. Also, remember to make a timeline.
1. Learning from the existing code.
2. Ask questions on the chatting room.
3. Don't be afraid of contributing. Once you get started, you will find it is not difficult at all, it just like a daily behavior.
4. Document you contribution for better communicating with others.
5. Pull request(create a new branch) and change your code according to reviewers' advice. Make sure to follow up with them quickly, in this way they will know you are truly want to contribute to this project!

Be responsible! Once you contribute to a project, then you are responsible for any bugs you introduced, so please be careful and try your best to take every condition into consideration. A good contribution is a crystallization of many considerations!