---
layout: post
subtitle: Leetcode Diary
title: 22. Generate Parentheses
date: 2020-07-18
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - backtracking
---

>Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses. 

**Example:**

```
n = 3
[
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]
```

#### Thoughts

- classic backtracking

#### Code(JAVA)

```java
public List<String> generateParenthesis(int n) {
    List<String>res = new ArrayList();
    backtracking("",0,0,n,res);
    return res;
}

private void backtracking(String cur, int left,int right,int n,List<String>res) {
    if(cur.length() == 2*n) {
        res.add(cur);
        return;
    }
    if(left == n)
        backtracking(cur+")",left,right+1,n,res);
    else if(left > right){
        backtracking(cur+"(",left+1,right,n,res);
        backtracking(cur+")",left,right+1,n,res);
    } 
    else if(left == right)
        backtracking(cur+"(",left+1,right,n,res);            
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
