# 250923 화 AM 1:00

from collections import Counter

def solution(topping):
    
    answer = 0
    right_cnt = Counter(topping)
    left_cnt = set()
    
    for t in topping:
        # 왼쪽에 토핑 추가
        left_cnt.add(t)
        
        # 오른쪽에서 토핑 개수 줄이기
        right_cnt[t] -= 1
        if right_cnt[t] == 0:
            del right_cnt[t]
            
        if len(left_cnt) == len(right_cnt):
            answer += 1
            
    return answer