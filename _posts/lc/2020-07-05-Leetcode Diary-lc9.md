---
layout: post
subtitle: Leetcode Diary
title: 9. Palindrome Number
date: 2020-07-05
author: Xudong
header-img: img/background.jpg
tags: 
    - leetcode
    - easy
    - math
---

> Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.


**Example 1:**

```
Input: 121
Output: true
```

**Example 2:**

```
Input: -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

**Example 3:**

```
Input: 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

>Follow up:
>Coud you solve it without converting the integer to a string?


#### Thoughts

- reverse num
- negative should always be false


#### Code(JAVA)

```java
public boolean isPalindrome(int x) {
  if (x<0)
      return false;
   return x == reverseNum(x); 
}
private int reverseNum(int x) {
    int res = 0;
    while(x!=0){
        res = res * 10 + x % 10;
        x = x / 10;
    }
    return res;
}

```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
