---
layout: post
title: 57. Insert Interval
subtitle: Leetcode Diary
date: 2020-09-10
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - sort
---

>Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
>
>You may assume that the intervals were initially sorted according to their start times.

**Example:**

```bash
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
```

#### Thoughts

- straightforward solution
- 因为数组是已经排好序的，所以可以从左往右扫描
- `(intv.end < newIntv.start || intv.start > newIntv.end)`，没有overlap
- 其他情况都是有overlap的情况，需要和`new interval` merge。
  - `newInterval[0] = Math.min(intervals[i][0],newInterval[0])`
  - `newInterval[1] = Math.max(intervals[i][1],newInterval[1])`

#### Code(JAVA)

```java
public int[][] insert(int[][] intervals, int[] newInterval) {
    List<int[]>res = new ArrayList();
    int i = 0;
    //add before new interval
    while(i < intervals.length) {
        if(intervals[i][1] >= newInterval[0])
            break;
        res.add(intervals[i]);
        i ++;
    }
    //merge all overlap interval
    while(i < intervals.length) {
        if(intervals[i][0] > newInterval[1])
            break;
        newInterval[0] = Math.min(intervals[i][0],newInterval[0]);
        newInterval[1] = Math.max(intervals[i][1],newInterval[1]);
        i ++;
    }
    res.add(newInterval);
    //add after new interval
    while(i < intervals.length) {
        res.add(intervals[i]);
        i ++;
    }
    return res.toArray(new int[res.size()][2]);
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
