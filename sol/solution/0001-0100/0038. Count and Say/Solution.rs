impl Solution {
    pub fn count_and_say(n: i32) -> String {
        let mut res = "1".to_string();
        for _ in 2..=n {
            let mut cur = String::new();
            let mut cnt = 1;
            let chars: Vec<char> = res.chars().collect();
            for j in 1..chars.len() {
                if chars[j] == chars[j-1] {
                    cnt += 1;
                } else {
                    cur.push_str(&cnt.to_string());
                    cur.push(chars[j-1]);
                    cnt = 1;
                }
            }
            cur.push_str(&cnt.to_string());
            cur.push(*chars.last().unwrap());
            res = cur;
        }
        res
    }
}