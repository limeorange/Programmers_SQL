from itertools import combinations
from collections import Counter

def solution(orders, course):
    answer = []
    for k in course:
        temp = []
        for i in orders:
            for j in combinations(i, k):
                temp.append(''.join(sorted(j)))       
        sorted_dic = Counter(temp).most_common()
        answer += [best[0] for best in sorted_dic if best[1] > 1 and best[1] == sorted_dic[0][1]]
    return sorted(answer)