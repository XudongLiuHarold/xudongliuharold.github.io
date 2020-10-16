---
layout: post
title: 65. Valid Number
subtitle: Leetcode Diary
date: 2020-09-15
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - string
---

>Validate if a given string can be interpreted as a decimal number.
>
>Note: It is intended for the problem statement to be ambiguous. You should gather all requirements up front before implementing one. However, here is a list of characters that can be in a valid decimal number:
-    Numbers `0-9`
-    Exponent - `e`
-    Positive/negative sign - `+/-`
-    Decimal point - `.`

>Of course, the context of these characters also matters in the input.

**Example**

```bash
"0" => true
" 0.1 " => true
"abc" => false
"1 a" => false
"2e10" => true
" -90e3   " => true
" 1e" => false
"e3" => false
" 6e-1" => true
" 99e2.5 " => false
"53.5e93" => true
" --6 " => false
"-+3" => false
"95a54e53" => false
```

#### Thoughts

- 要注意考虑所有可能的`invalid`的情况：
- 对于正负号 `+/-`
  - 首个字符可以是正负号
  - 指数后的首个字符可以是正负号
  - 其他位置则不可以出现正负号
- 对于小数点 `.`：
  - 小数点只能出现一次
  - 小数点前或者后要有数字出现
- 对于指数 `e`：
  - 指数只能出现一次
  - 指数前必须有数字
  - 指数后不能出现小数点

#### Code(JAVA)

```java
public boolean isNumber(String s) {
    s = s.trim();
    boolean decimalShown = false;
    boolean exponentShown = false;
    boolean numberShown = false;
    for(int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        if(c >= '0' && c <= '9')
            numberShown = true;
        else if(c == '-' || c == '+') {
            if(i != 0 && s.charAt(i-1) != 'e')
                return false;
        }
        else if(c == '.' && !decimalShown)           
            decimalShown = true; 
        else if(c == 'e' && !exponentShown) {
            if(!numberShown)
                return false;
            exponentShown = true;
            decimalShown = true;
            numberShown = false;
        }
        else
            return false;
    }
    return numberShown;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
