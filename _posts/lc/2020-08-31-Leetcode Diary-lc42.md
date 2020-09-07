---
layout: post
title: 42. Trapping Rain Water
subtitle: Leetcode Diary
date: 2020-08-31
author: Xudong
header-img: img/background.jpg
tags: 
    - hard 
    - two pointers
---

>Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.

**Example:**

```bash
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
```


#### Thoughts

- 类似[LC11](),但是又相对更复杂一些。
- 这里要找总共能装下多少水，其实就是要找到每一个位置对应的左侧最高高度和右侧最高高度，然后计算出差值得到当前位置能够存储水的大小：\\(Math.min(left_height, right_height)- height[i]\\)。
- 使用`two pointer`的解法，如果左侧比右侧高，则向里移动右侧，反之则移动左侧。
- 每移动依次都同步更新当前高度能够存储水的多少并且把左侧最高或者右侧最高同步更新到当前位置。
- 最后全部加总起来就是能够存储的所有的水量。

#### Code(JAVA)

```java
public int trap(int[] height) {
    int res = 0, l = 0, r = height.length-1;
    while(l < r) {
        if(height[l] < height[r]) {
            if(l+1<height.length && height[l+1] < height[l])
                res += height[l] - height[l+1];
            height[l+1] = Math.max(height[l],height[l+1]);
            l ++;
        }
        else {
            if(r-1>=0 && height[r-1] < height[r])
                res += height[r] - height[r-1];
            height[r-1] = Math.max(height[r],height[r-1]);
            r --;   
        }
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
