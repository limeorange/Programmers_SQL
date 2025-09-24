# 250925 목 AM 12:57 / 2644 촌수계산

import sys
sys.setrecursionlimit(10**6)
input = sys.stdin.readline

def DFS(idx, level):
    global answer, graph, visited, end

    # 재방문 방지
    visited[idx] = True

    # 친척 관계가 있는 경우
    if idx == end:
        answer = level
        return

    # 방문할 노드 탐색 (연결O, 방문X)
    for next_node in graph[idx]:
        if not visited[next_node]:
            DFS(next_node, level+1)

# 0. 입력 및 초기화
N = int(input())
start, end = map(int, input().split())
M = int(input())
graph = [[] for _ in range(N+1)]
visited = [False] * (N+1)
answer = -1

# 1. graph 연결 정보 채우기
for _ in range(M):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)

# 2. DFS 호출
DFS(start, 0)

# 3. 정답 출력
print(answer)