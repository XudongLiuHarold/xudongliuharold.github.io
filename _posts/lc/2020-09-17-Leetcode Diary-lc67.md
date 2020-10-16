---
layout: post
title: 67. Add Binary
subtitle: Leetcode Diary
date: 2020-09-17
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - array
---

>Given two binary strings, return their sum (also a binary string).
>
>The input strings are both non-empty and contains only characters `1` or `0`.
>Constraints:
-    Each string consists only of '0' or '1' characters.
-    1 <= a.length, b.length <= 10^4
-    Each string is either "0" or doesn't contain any leading zero.

**Example**

```bash
Input: a = "11", b = "1"
Output: "100"

Input: a = "1010", b = "1011"
Output: "10101"
```

#### Thoughts

- 从后往前相加即可，注意进位
- 使用 `stringbuilder` 可以提速

#### Code(JAVA)

```java
public String addBinary(String a, String b) {
    int carry = 0, i = 0;
    StringBuilder res = new StringBuilder();
    while(carry != 0 || i < a.length() || i < b.length()) {
        int x = i < a.length() ? a.charAt(a.length() - 1 - i) - '0' : 0;
        int y = i < b.length() ? b.charAt(b.length() - 1 - i) - '0' : 0;
        int val = x + y + carry;
        res.append(val % 2);
        carry = val / 2;
        i ++;
    }
    return res.reverse().toString();
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
