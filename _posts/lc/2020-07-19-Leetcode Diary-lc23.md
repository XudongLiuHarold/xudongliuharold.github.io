---
layout: post
subtitle: Leetcode Diary
title: 23. Merge k Sorted Listss
date: 2020-07-19
author: Xudong
header-img: img/background.jpg
tags: 
    - hard
    - linkedlist
---

>You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.
>
> *Merge all the linked-lists into one sorted linked-list and return it.*s

**Example:**

```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]
Explanation: The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6

Input: lists = []
Output: []
```

#### Thoughts

- 可以看成是[LC21](https://xudongliuharold.github.io/2020/07/17/Leetcode-Diary-lc21/)的进阶版
- 把`merge n` 分解成 `merge two`,然后解决即可
- 按照divide and conquer的思想，分成一对一对的list分别merge，然后再把merge 后的list重新分成一对一对的，继续merge，直到全部merge成一个list为止

#### Code(JAVA)

```java
public ListNode mergeKLists(ListNode[] lists) {
    int n = lists.length;
    if(n == 0)
        return null;
    while(n > 1) {
        for(int i = 0; i < n/2; i++){
            lists[i] = mergeTwoList(lists[i],lists[n-1-i]);
        }
        if(n % 2 != 0)
            lists[0] = mergeTwoList(lists[0],lists[n/2]);
        n = n / 2;
    } 
    return lists[0];
}

private ListNode mergeTwoList(ListNode l1, ListNode l2) {
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
