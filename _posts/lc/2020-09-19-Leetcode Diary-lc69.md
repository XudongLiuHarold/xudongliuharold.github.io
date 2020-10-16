---
layout: post
title: 69. Sqrt(x)
subtitle: Leetcode Diary
date: 2020-09-13
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - math
---

>Implement int sqrt(int x).
>
>Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
>
>Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

**Example**

```bash
Input: 4
Output: 2

Input: 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since 
             the decimal part is truncated, 2 is returned.
```

#### Thoughts

- 牛顿法：
$$
x_{n+1} = x_n - \frac{f(x_n)}{f^{'}(x_n)}  \tag{1}
$$
- 二分法：
  - 二分搜索法，从`[1,x/2]`的区间开始搜索，每次减半，最后发现结果
#### Code(JAVA)

```java
//newton method:
public int mySqrt(int x) {
    if(x == 1)
        return x;
    double guess = x/2;
    while(Math.abs(guess * guess - x) > 0.1) {
        guess = guess / 2 + x / (2 * guess) ;
    }
    return (int)guess;
}
//binary search 
public int mySqrt(int x) {
    if(x == 0 || x == 1)
        return x;
    int low = 1, high = x / 2;
    while(low <= high) {
        int mid = (low + high) / 2;
        long squre = (long)mid * mid;
        if(squre == x)
            return mid;
        else if(squre < x)
            low = mid + 1;
        else
            high = mid - 1;
    }
    return high;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
