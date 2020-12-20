---
layout: post
subtitle: Leetcode Diary
title: 26. Remove Duplicates from Sorted Array
date: 2020-07-22
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - two pointers
---

### [Problem Description](https://leetcode.com/problems/remove-duplicates-from-sorted-array/)

#### Thoughts

- classic two pointers
- iterate array from left to right
- one pointer for all unique values, one pointer for all values in array

#### Code(JAVA)

```java
public int removeDuplicates(int[] nums) {
    if(nums.length == 0)
        return 0;
    int indexing = 1;
    for(int i = 1; i < nums.length;  i++) {
        if(nums[i] == nums[i-1])
            continue;
        nums[indexing] = nums[i];
        indexing ++;
    }
    return indexing;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
