---
layout: post
subtitle: Leetcode Diary
title: 16. 3Sum Closest
date: 2020-07-12
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - two pointers
---

> Given an array `nums` of n integers and an integer `target`, find three integers in `nums` such that the sum is closest to `target`. Return the sum of the three integers. You may assume that each input would have exactly one solution.

**Example 1:**

```
Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
```

#### Thoughts

- Same solution like [3 Sum](https://xudongliuharold.github.io/2020/07/11/Leetcode-Diary-lc15/)
- Store a closet var to compare and get the closet value

#### Code(JAVA)

```java
public int threeSumClosest(int[] nums, int target) {
    int res = Integer.MAX_VALUE;
    Arrays.sort(nums);
    for(int i = 0; i < nums.length - 2; i++){
        int l = i +1, r = nums.length - 1;
        while(l < r) {
            int val = nums[i] + nums[l] + nums[r];
            if(res == Integer.MAX_VALUE || 
               Math.abs(target - val) < Math.abs(target - res))
                res = val;
            if(val == target)
                return val;
            else if(val < target)
                l ++;
            else
                r --;
        }
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
