---
layout: post
title: 58. Length of Last Word
subtitle: Leetcode Diary
date: 2020-09-10
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - string
---

>Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
>
>If the last word does not exist, return 0.
>
>Note: A word is defined as a **maximal substring** consisting of non-space characters only.

**Example**

```bash
Input: "Hello World"
Output: 5
```

#### Thoughts

- 需要注意最后有空格的情况，要对字符串做一个类似`trim()`的操作

#### Code(JAVA)

```java
public int lengthOfLastWord(String s) {
    int res = 0;
    boolean noCharacter = true;
    for(int i = s.length()-1; i >=0; i--) {
        if(s.charAt(i) == ' ') {
            if(noCharacter)
                continue;
            else
                break;
        }
        res ++;
        noCharacter = false;
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
