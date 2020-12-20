---
layout: post
title: 71. Simplify Path
subtitle: Leetcode Diary
date: 2020-12-18
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - stack
---

### [Problem Description](https://leetcode.com/problems/simplify-path/)

#### Thoughts

- 把path `split` 成一个个子路径
- 使用一个`stack` 遍历所有的路径
  - 当子路径为`.`和空时，不进栈
  - 当子路径为`..`时，pop出上一层路径
- 最后再从`bottom`到`top`遍历栈，把路径拼装回去

```java
public String simplifyPath(String path) {
    String[]paths = path.split("/");
    Stack<String> s = new Stack<String>();
    for(String dir : paths) {
        if(dir.equals(".") || dir.isEmpty())
            continue;
        if(dir.equals("..")) {
            if(!s.isEmpty())
                s.pop();
        }
        else
            s.push(dir);
    }
    StringBuilder res = new StringBuilder();
    for(String dir : s) {
        res.append("/");
        res.append(dir);
    }
    return res.length() == 0 ? "/" : res.toString();
}

```

<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
