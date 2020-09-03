---
layout: post
title: Leetcode Diary
subtitle: 46.47. Permutations(I II)
date: 2020-09-03
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - backtracking
---

>Given a collection of **distinct** integers, return all possible permutations.

**Example:**

```bash
Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
```

>Given a collection of numbers that might contain duplicates, return all possible unique permutations.

**Example:**


```bash
Input: [1,1,2]
Output:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
```

#### Thoughts

- 对于没有重复元素的数组，可以使用一个`visited`数组来记录是否已经访问过，然后其他的就是经典的`backtracking`或者说是`DFS`算法。
- 对于有重复元素的数组，在上述基础上，还要加上去重的步骤，在`backtracking`算法中，经典的去重操作就是对数组进行排序，然后对于重复元素的进行剪枝。
- 本题还有一种解法是在基本架构不变的情况下，每次循环中`swap`交换前两个原素用来代替`visited`数组，可以节省空间，降低空间复杂度。

#### Code(JAVA)

```java
// without repeat elements
List<List<Integer>>res;
public List<List<Integer>> permute(int[] nums) {
    res = new ArrayList();
    backtracking(new ArrayList(),nums,newboolean[nums.length]);
    return res;
}

private void backtracking(List<Integer> cur, in[] nums, boolean[] visited){
    if(cur.size() == nums.length) {
        res.add(new ArrayList<Integer>(cur));
        return;
    }
    
    for(int i = 0; i < nums.length; i ++) {
        if(visited[i])
            continue;
        cur.add(nums[i]);
        visited[i] = true;
        backtracking(cur,nums,visited);
        cur.remove(cur.size()-1);
        visited[i] = false;
    }
}

//with repeat element
List<List<Integer>> res;
public List<List<Integer>> permuteUnique(int[]nums) {
    res = new ArrayList();
    Arrays.sort(nums);
    backtracking(nums,new ArrayList(),newboolean[nums.length]);
    return res;
}

private void backtracking(int[] nums,List<Integer>cur, boolean[] visited) {     
    if(cur.size() == nums.length) {
        res.add(new ArrayList(cur));
        return;
    }
    for(int i = 0; i < nums.length; i++) {
        if(visited[i])
            continue;
        if(i > 0 && nums[i] == nums[i-1] &&!visited[i-1])
             continue;
        cur.add(nums[i]);
        visited[i] = true;
        backtracking(nums,cur,visited);
        cur.remove(cur.size()-1);
        visited[i] = false;
    }
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
