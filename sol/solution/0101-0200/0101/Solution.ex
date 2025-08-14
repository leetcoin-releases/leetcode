# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end
defmodule Solution do
  @spec is_symmetric(root :: TreeNode.t | nil) :: boolean
  def is_symmetric(nil), do: true
  def is_symmetric(root) do
    is_mirror(root.left, root.right)
  end
  defp is_mirror(nil, nil), do: true
  defp is_mirror(nil, _), do: false
  defp is_mirror(_, nil), do: false
  defp is_mirror(left, right) do
    left.val == right.val and
      is_mirror(left.left, right.right) and
      is_mirror(left.right, right.left)
  end
end