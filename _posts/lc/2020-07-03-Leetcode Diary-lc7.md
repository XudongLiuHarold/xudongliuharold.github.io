---
layout: post
subtitle: Leetcode Diary
title: 7. Reverse Integer
date: 2020-07-03
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - math
---

>Given a 32-bit signed integer, reverse digits of an integer.

**Example 1:**
```
Input: 123
Output: 321
```

**Example 2:**
```
Input: -123
Output: -321
```

**Example 3:**
```
Input: 120
Output: 21
```

>Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.


#### Solution

- 类似`bit manipulate`中的`左移`和`右移`来解决问题
- 左移:
$$x  = x / 10 $$
- 右移:
$$y = y * 10 + mod $$
- 注意防范overflow，先使用`long`型，最后再转换成`int`型

#### Code(JAVA)

```java
public int reverse(int x) {
    long res = 0l;
    while(x!=0){
        res = res*10 + x%10;
        if(res < Integer.MIN_VALUE || res> Integer.MAX_VALUE)
            return 0;
        x = x / 10;
    }
    return (int)res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
