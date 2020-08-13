---
layout: post
title: Leetcode Diary
subtitle: 17. Letter Combinations of a Phone Number
date: 2020-07-13
author: Xudong
header-img: img/background.jpg
tags: 
    - medium
    - backtracking
---

>Given a string containing digits from `2-9` inclusive, return all possible letter combinations that the number could represent.
>
>A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

**Example:**

```
Input: "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
```

#### Thoughts

- backtracking
- 建立起号码和对应字母的mapping，可以使用数组

#### Code(JAVA)

```java
List<String> res = new ArrayList();
String letters[] = {"abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"};
public List<String> letterCombinations(String digits) {
    if(digits.length() == 0)
        return res;
    //call backtracking func
    backtracking(new StringBuilder(),0,digits);
    return res;
}

private void backtracking(StringBuilder cur,
                       int i,
                       String digits) {
    if(i == digits.length()) {
        res.add(cur.toString());
        return;
    }
    int realIndexing = digits.charAt(i) - '2'; 
    for(int j = 0; j < letters[realIndexing].length(); j++) {
        // add 'a'
        char c = (char)letters[realIndexing].charAt(j);
        cur.append(c);
        backtracking(cur,i+1,digits);
        // remove 'a'
        cur.setLength(cur.length()-1);
    }
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
