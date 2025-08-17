# [**108. Convert Sorted Array to Binary Search Tree**](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/)

Given an integer array `nums` where the elements are sorted in **ascending order**, convert it to a **height-balanced** binary search tree.

#### **Example 1:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode/refs/heads/main/res/ino/474383793.jpg" style="width: 100%; height: 600;"/>

```md
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:
```

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode/refs/heads/main/res/ino/474383077.jpg" style="width: 100%; height: 600;"/>

#### **Example 2:**

<img src="https://raw.githubusercontent.com/leetcoin-releases/leetcode/refs/heads/main/res/ino/474383611.jpg" style="width: 100%; height: 600;"/>

```md
Input: nums = [1,3]
Output: [3,1]
Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
```

#### **Constraints:**
```md
• 1 <= nums.length <= 10⁴
• -10⁴ <= nums[i] <= 10⁴
• nums is sorted in a strictly increasing order.
```