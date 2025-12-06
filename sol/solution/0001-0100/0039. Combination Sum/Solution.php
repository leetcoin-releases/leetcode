class Solution {
    /**
     * @param Integer[] $candidates
     * @param Integer $target
     * @return Integer[][]
     */
    function combinationSum($candidates, $target) {
        sort($candidates);
        $result = [];
        $current = [];
        $backtrack = function($start, $remaining) use (&$backtrack, &$result, &$current, $candidates) {
            if ($remaining == 0) {
                $result[] = $current;    
                return;
            }
            for ($i = $start; $i < count($candidates); $i++) {
                $num = $candidates[$i];
                if ($num > $remaining) {
                    break; 
                }
                $current[] = $num;
                $backtrack($i, $remaining - $num);
                array_pop($current);              
            }
        };
        $backtrack(0, $target);
        return $result;
    }
}