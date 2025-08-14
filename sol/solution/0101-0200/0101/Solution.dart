/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  bool isSymmetric(TreeNode? root) {
    bool isMirror(TreeNode? left, TreeNode? right) {
      if (left == null && right == null) return true;
      if (left == null || right == null) return false;
      return left.val == right.val &&
          isMirror(left.left, right.right) &&
          isMirror(left.right, right.left);
    }
    return isMirror(root, root);
  }
}