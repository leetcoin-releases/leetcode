# @param {Integer} n
# @return {String}
def count_and_say(n)
    res = "1"
    (2..n).each do
        cur = ""
        cnt = 1
        (1...res.length).each do |j|
            if res[j] == res[j-1]
                cnt += 1
            else
                cur += cnt.to_s + res[j-1]
                cnt = 1
            end
        end
        cur += cnt.to_s + res[-1]
        res = cur
    end
    res
end