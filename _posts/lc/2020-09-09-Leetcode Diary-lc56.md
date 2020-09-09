---
layout: post
title: 56. Merge Intervals
subtitle: Leetcode Diary
date: 2020-09-09
author: Xudong
header-img: img/background.jpg
tags: 
    - meidum
    - sort
---

>Given a collection of intervals, merge all overlapping intervals.
>
>`intervals[i][0] <= intervals[i][1]`


**Example:**

```bash
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```


#### Thoughts
- 根据间隔起始时间把间隔排序
  - priority queue
  - sort compartor
- 遍历排序后的间隔
- 对于`interval1`和 `interval2`
  - `if(interval1[1] >= interval2[0])` merge两个区间
  - 否则把interval1放进结果里面，interval2变interval1

#### Code(JAVA)

```java
public int[][] merge(int[][] intervals) {
    if(intervals.length == 0)
        return new int[0][0];
    PriorityQueue<int[]> queue = new PriorityQueue<int[]>((a,b) -> {
        return a[0] - b[0];
    });
    //sort interval
    for(int i = 0; i < intervals.length; i++) {
        queue.add(intervals[i]);
    }
    //merge interval
    List<int[]> res = new ArrayList();
    int[] prev = queue.poll();
    while(!queue.isEmpty()) {
        int[]cur = queue.poll();
        if(prev[1] >= cur[0])
            prev[1] = Math.max(prev[1],cur[1]);
        else {
            res.add(prev);
            prev = cur;
        }
    }
    res.add(prev);
    //convert answer
    return res.toArray(new int[res.size()][2]);
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
