---
layout: post
title: Leetcode Diary
subtitle: 50. Pow(x, n)
date: 2020-09-05
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - binary search
    - math
---

>Implement pow(x, n), which calculates x raised to the power n (i.e. xn).

**Constraints:**
-  $$-100.0 < x < 100.0 $$
-  $$-2^{31} <= n <= 2^{31}-1 $$
-  $$-10^4 <= x^n <= 10^4$$


**Example:**

```bash
Input: x = 2.00000, n = 10
Output: 1024.00000

Input: x = 2.10000, n = 3
Output: 9.26100

Input: x = 2.00000, n = -2
Output: 0.25000
Explanation: 2-2 = 1/22 = 1/4 = 0.25
```


#### Thoughts

- $$x^n = x^{\frac{n}{2}} * x^{\frac{n}{2}} \tag{1.1} $$
- $$x^n = (x^{\frac{n}{4}} * x^{\frac{n}{4}}) * (x^{\frac{n}{4}} * x^{\frac{n}{4}}) \tag{1.1} $$
- 所以问题就可以转换成一个二分法递归的问题
- 注意考虑一些corner case
- Beyond the topic:
    - 对于计算机而言，每一个计算的复杂度是差不多的，无论你是算`1*1` 还是算`123*256`，本质上对于计算机而言，差别是不大的。
    - 所以在写算法的过程中，更为重要的是使用更少的计算次数得到结果，这样对计算机来说，才是真正地“省力”。
    - 这点正好和人的正常思维逻辑是相反的，我们有时候更偏好于使用更多简单的工作来替代一个复杂的工作，即便拆分出来的简单的工作的数量会远远超过复杂工作。

#### Code(JAVA)

```java
public double myPow(double x, int n) {
    return n < 0 ? 1 / fastPow(x,-n) : fastPow(xn);
}
private double fastPow(double x, int n) {
    if(n == 0)
        return 1.0;
    double half = fastPow(x, n/2);
    return n % 2 == 0? half * half : half * half * x;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
