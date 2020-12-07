---
layout: post
title: 70. Climbing Stairs
subtitle: Leetcode Diary
date: 2020-12-06
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - dynamic programming
---

>You are climbing a staircase. It takes `n` steps to reach the top.
>
>Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?

**Example**

```bash
Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

#### Thoughts

- Classic & maybe the simplest Dynamic programming
$$
dp[i+2] = dp[i] + dp[i+1]
$$
- Optimize memory by using 2 vars to store states.

```java
public int climbStairs(int n) {
    if(n < 2)
        return n;
    int prev = 1, cur = 1;
    int i = 2;
    while( i <= n) {
        int next = prev + cur;
        prev = cur;
        cur = next;
        i ++;
    }
    return cur;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
