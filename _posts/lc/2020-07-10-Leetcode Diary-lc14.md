---
layout: post
title: Leetcode Diary
subtitle: 14. Longest Common Prefix
date: 2020-07-10
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - string
---

>Write a function to find the longest common prefix string amongst an array of strings.
>
>If there is no common prefix, return an empty string `""`.

**Example 1:**

```
Input: ["flower","flow","flight"]
Output: "fl"
```

#### Thoughts

- 盲选第一个字符串为`common prefix`
- 从前往后遍历字符串，对于每一个字符遍历数组中其他的字符串，看对应位置是否是相同的字符，发现不同，则立刻返回`prefix.substring(0,i)`

#### Code(JAVA)

```java
public String longestCommonPrefix(String[]strs) {
    if(strs.length == 0)
        return "";
    String prefix = strs[0];
    for(int i = 0; i < prefix.length(); i++) {
        char c = prefix.charAt(i);
        for(int j = 1; j < strs.length; j++) {
            if(strs[j].length() <= i || str[j].charAt(i) != c)
                return prefix.substring(0,i);
        }
    }
    return prefix;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
