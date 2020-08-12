---
layout: post
title: Leetcode Diary
subtitle: 15. 3Sum
date: 2020-07-11
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - array
    - two pointers
---

> Given an array `nums` of n integers, are there elements a, b, c in nums such that `a + b + c = 0`? Find all unique triplets in the array which gives the sum of zero.
>
>Note:
>
>The solution set must not contain duplicate triplets.

**Example:**

```
Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

#### Thoughts

- 排序
- 使用一个循环，将问题变成寻找`(a,b)`满足
$$
a + b = 0 -c 
$$
- 循环内部是一个sorted array的 `two sum` 问题，使用左右两个指针解决
- ⚠️：可能出现重复的数字，需要在遍历的时候排除
#### Code(JAVA)

```java
public List<List<Integer>> threeSum(int[]nums) {
    List<List<Integer>>res = new ArrayList();
    Arrays.sort(nums);
    for(int i = 0; i < nums.length - 2; i++) {
        if(i > 0 && nums[i] == nums[i-1])
            continue;
        int l = i + 1, r = nums.length - 1;
        while(l < r) {
            if(nums[l] + nums[r] + nums[i] ==0) {
                //remove duplicate elements
                if(l == i +1 || nums[l] !=nums[l-1])
                    res.add(newArrayList<Integer>(ArraysasList(nums[i],
                                                               nums[l],
                                                               nums[r])));
                l ++;
                r --;
            }
            else if(nums[l] + nums[r] + num[i] < 0)
                l ++;
            else
                r --;
        }
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
