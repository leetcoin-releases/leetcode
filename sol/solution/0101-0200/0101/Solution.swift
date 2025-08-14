/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil { return true }
            if left == nil || right == nil { return false }
            return left!.val == right!.val &&
                isMirror(left!.left, right!.right) &&
                isMirror(left!.right, right!.left)
        }
        return isMirror(root?.left, root?.right)
    }
}