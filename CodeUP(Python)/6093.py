# 6093

n = int(input())
a = input().split()

for i in range(n-1, -1, -1):
    a[i] = int(a[i])
    print(a[i], end= ' ')