---
layout: post
subtitle: Leetcode Diary
title: 11. Container With Most Water
date: 2020-07-07
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - two pointers
---

>Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
>
>Note: You may not slant the container and n is at least 2.


![lc-11](https://github.com/XudongLiuHarold/xudongliuharold.github.io/blob/master/img/lc-img/lc_11.jpg)


**Example:**

```
Input: [1,8,6,2,5,4,8,3,7]
Output: 49
```


#### Thoughts

- 设左右两个指针\\(l\\)和\\(r\\),从两侧向中间移动，扫描所有有可能大于当前最大值的长方形
- 因为向中间移动肯定会导致底部变短，所以每次移动要选择有可能使得高(high)变长的指针移动

#### Code(JAVA)

```java
public int maxArea(int[] height) {
    int l = 0, r = height.length-1;
    int area = 0;
    while(l < r){
        area = Math.max(area,Math.min(height[l],height[r])*(r-l));
        if(height[l] < height[r])
            l ++;
        else
            r --;
    }
    return area;
}

```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
