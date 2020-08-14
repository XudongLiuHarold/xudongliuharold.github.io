---
layout: post
title: Leetcode Diary
subtitle: 21. Merge Two Sorted Lists
date: 2020-07-17
author: Xudong
header-img: img/background.jpg
tags: 
    - easy
    - linkedlist
---

>Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

**Example:**

```
Input: 1->2->4, 1->3->4
Output: 1->1->2->3->4->4
```

#### Thoughts

- 使用一个dummyhead,串接新的list
- 比较`l1`和`l2`，`val`小的加在list上
- `l1`和`l2`全部遍历完即可得到merge的新list

#### Code(JAVA)

```java
public ListNode mergeTwoLists(ListNode l1, ListNodel2) {
    ListNode dummyHead = new ListNode(0);
    ListNode cur = dummyHead;
    while(l1 != null || l2 != null) {
        if(l1 == null) {
            cur.next = l2;
            break;
        }
        if(l2 == null) {
            cur.next = l1;
            break;
        }
        if(l1.val < l2.val) {
            cur.next = l1;
            l1 = l1.next;
        }
        else {
            cur.next = l2;
            l2 = l2.next;
        }
        cur = cur.next;            
    }
    return dummyHead.next;
}
```


<script type="text/javascript" src="https://xudongliuharold.github.io/js/latex-math.js?config=default"></script>
