---
layout: post
title: Leetcode Diary 
subtitle: 4. Median of Two Sorted Arrays
date: 2020-06-29
author: Xudong
header-img: img/background.jpg
tags: 
    - leetcode
    - binary search
    - math
    - hard
---

>There are two sorted arrays nums1 and nums2 of size m and n respectively.
>
>Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
>
>You may assume nums1 and nums2 cannot be both empty.

**Example 1:**
```bash
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
```
**Example 2:**
```bash
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
```

#### Solution

- 因为要寻找中位数，所以需要把两个数组分成较小的子集和较大的子集两部分，假设我们已经分好了这两个子集，那么中位数就应该为:
  $$Median = \frac{max(leftsubset) + min(right subset)}{2}$$
- 设这两个数组为
$$[a_0,a_1,....,a_{m-1}], [b_0,b_1,..,b_{n-1}]$$
- 假设存在这样一对\\((i,j)\\)，能够把两个数组正好分成上面描述的两个子集，则需要满足：
$$a_{i-1} <= b_{j} \tag{1}$$ <br>
$$b_{j-1} <= a_{i} \tag{2}$$ <br>
$$ i + j = m + n - i - j \tag{3}$$  
- 由 (3) 可得：
$$j = \frac{m+n}{2} - i$$
- 所以每一个\\(i\\)都有唯一确定的\\(j\\)对应，因此这个问题就转换成了在第一个数组中搜索满足条件\\((1)\\)和\\(2)\\)的\\(i\\)。
- 因为时间复杂度要求为\\(O(\log(m+n))\\)，所以使用binary search的方法


#### Code (JAVA)

```java

public double findMedianSortedArrays(int[] nums1, int[] nums2) {
    int m = nums1.length, n = nums2.length;
    if(m>n)
        return findMedianSortedArrays(nums2,nums1);
    //get (i , j) via binary search
    int i = binarySearch(nums1,nums2,0,m);
    int j = (m+n+1)/2 - i;
    //find left subset max value && right subset min value
    int maxLeft, minRight;
    if(i == 0)
        maxLeft = nums2[j-1];
    else if(j == 0)
        maxLeft = nums1[i-1];
    else
        maxLeft = Math.max(nums1[i-1],nums2[j-1]);
    if((m+n)%2 != 0)
        return maxLeft / 1.0;
    if(i == m)
        minRight = nums2[j];
    else if(j == n)
        minRight = nums1[i];
    else
        minRight = Math.min(nums1[i],nums2[j]);
    return (maxLeft + minRight) / 2.0;        
}
// binary search i to meet (1) && (2)
private int binarySearch(int[] nums1, int[] nums2, int lo, int hi) {
    int i = (lo + hi) / 2;
    int j = (nums1.length + nums2.length + 1) / 2 - i;
    
    if((i == 0 || j == nums2.length || nums1[i-1] <= nums2[j]) &&
       (i == nums1.length || j == 0 || nums2[j-1] <= nums1[i]))
        return i;
    else if(i > 0 && nums1[i-1] > nums2[j])
        return binarySearch(nums1,nums2,lo,i-1);
    else if(j > 0 && nums2[j-1] > nums1[i])
        return binarySearch(nums1,nums2,i+1,hi);
    return -1;
}

```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
