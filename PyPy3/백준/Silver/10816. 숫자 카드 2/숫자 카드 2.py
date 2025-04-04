from collections import Counter

N = int(input())
N_lst = list(map(int, input().split()))
M = int(input())
M_lst = list(map(int, input().split()))

N_dic = Counter(N_lst)
print(' '.join(str(N_dic[i]) if i in N_dic.keys() else '0' for i in M_lst))