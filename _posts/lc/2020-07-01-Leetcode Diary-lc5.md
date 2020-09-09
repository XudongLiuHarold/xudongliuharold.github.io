---
layout: post
subtitle: Leetcode Diary
title: 5. Longest Palindromic Substring
date: 2020-07-01
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - string
---

>Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

**Example 1:**
```bash
Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.
```
**Example 2:**
```bash
Input: "cbbd"
Output: "bb"
```

#### Solution

- 如果一个string是回文的，那么它可能有奇数和偶数两种对称形式
- 从前往后遍历字符串每个字符为中心的两种回文形式
- 选择长度最长的返回

**Tips**

- 已知回文子字符串的长度 \\(length\\) 和 回文的一个中心点 \\(i\\), 如何计算这个子字符串的起点和终点:

$$ start = i - \frac{length-1}{2} \tag{1}$$ 
$$ end = i + \frac{length}{2}  \tag{2}$$ 

#### Code(JAVA)

```java
public String longestPalindrome(String s) {
    if(s.length() == 0)
        return "";
    int start = 0, end = 0;
    for(int i = 0; i < s.length(); i++) {
        int len = Math.max(expandCenter(s,i,i)expandCenter(s,i,i+1));
        if(len > end - start) {
            start = i - (len - 1) / 2;
            end = i + len / 2;
        }
    }
    return s.substring(start,end+1);
}
    
private int expandCenter(String s, int l, intr) {
    while(l >= 0 &&
          r < s.length() &&
          s.charAt(l) == s.charAt(r)) {
        l --;
        r ++;
    }
    return r - l - 1;
}

```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
