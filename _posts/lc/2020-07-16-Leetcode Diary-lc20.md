---
layout: post
subtitle: Leetcode Diary
title: 20. Valid Parentheses
date: 2020-07-16
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - stack
---

>Given a string containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.
>
>An input string is valid if:
>
>- Open brackets must be closed by the same type of brackets.
>- Open brackets must be closed in the correct order.

>**Note** that an empty string is also considered valid.

#### Thoughts

- 使用stack的特性，遇到 `'('`, `'{'`, `'['` push, 遇到`')'`,  `'}'`, `']'` pop
- 如果不对应则返回`false`
- 遍历结束如果stack不为空则返回`false`
- 其余情况返回`true`

#### Code(JAVA)

```java
public boolean isValid(String s) {
    Stack<Character> stack = new Stack();
    for(int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        if(c == '(' || c =='{' || c == '[') {
            stack.push(c);
            continue;
        }
        if(stack.isEmpty())
            return false;
        char p = stack.pop();
        if((c == ')' && p == '(') ||
           (c == '}' && p == '{') ||
           (c == ']' && p == '['))
            continue;
        else 
            return false;
    }
    return stack.isEmpty();
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
