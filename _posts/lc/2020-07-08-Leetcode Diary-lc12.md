---
layout: post
title: Leetcode Diary
subtitle: 12. Integer to Roman
date: 2020-07-08
author: Xudong
header-img: img/background.jpg
tags:   
    - math
    - string

---

> Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.

**Examples:**
```
Input: 9
Output: "IX"

Input: 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.

Input: 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
```

#### Thoughts

- 使用两个数组将复杂的转换简单化
```java
int[] base = new int[] {1000,900,500,400,100,90,50,40,10,95,4,1}; 
String[] pattern = new String[]{"M","CM","D","CD","C","XC""L","XL","X","IX","V","IV","I"};
```
- 遍历数组，将要转化的数字拆分成相对应的`base`数组的数字组合，然后转化成对应的罗马字母

$$1994 = 1000(M) + 900(CM) + 90 (XC) + 4 (IV) \tag{1} $$
$$1994 = MCMXCIV  \tag{2}$$

#### Code(JAVA)

```java
public String intToRoman(int num) {
    // transfer complex case to simple one
    int[] base = new int[] {1000,900,500,400,100,90,50,40,10,95,4,1}; 
    String[] pattern = new String[]{"M","CM","D","CD","C","XC""L","XL","X","IX","V","IV","I"};
    
    String res = "";
    for(int i = 0; i < base.length; i++) {
        time = num /  base[i];
        if(time > 0) {
            for(int j = 0; j < time; j++) {
                res += pattern[i];
            }
        }
        //update num
        num = num - time*base[i];
    }
    return res;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
