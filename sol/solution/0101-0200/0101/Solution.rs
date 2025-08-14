// Definition for a binary tree node.
// #[derive(Debug, PartialEq, Eq)]
// pub struct TreeNode {
//   pub val: i32,
//   pub left: Option<Rc<RefCell<TreeNode>>>,
//   pub right: Option<Rc<RefCell<TreeNode>>>,
// }
// 
// impl TreeNode {
//   #[inline]
//   pub fn new(val: i32) -> Self {
//     TreeNode {
//       val,
//       left: None,
//       right: None
//     }
//   }
// }
use std::rc::Rc;
use std::cell::RefCell;
impl Solution {
    pub fn is_symmetric(root: Option<Rc<RefCell<TreeNode>>>) -> bool {
        fn is_mirror(
            left: Option<Rc<RefCell<TreeNode>>>,
            right: Option<Rc<RefCell<TreeNode>>>,
        ) -> bool {
            match (left, right) {
                (None, None) => true,
                (Some(l), Some(r)) => {
                    let l = l.borrow();
                    let r = r.borrow();
                    l.val == r.val
                        && is_mirror(l.left.clone(), r.right.clone())
                        && is_mirror(l.right.clone(), r.left.clone())
                }
                _ => false,
            }
        }
        match root {
            None => true,
            Some(node) => {
                let node = node.borrow();
                is_mirror(node.left.clone(), node.right.clone())
            }
        }
    }
}