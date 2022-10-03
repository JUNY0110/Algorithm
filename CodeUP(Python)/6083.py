# 6083

r, g, b= map(int, input().split())
# result = 0
if 0 <= r <= 127 and 0 <= g <= 127 and 0 <= b <= 127:
    for i in range(0, r):
        for j in range(0, g):
            for k in range(0, b):
                print(i, j, k, sep=' ')
                # result += 1
print(r*g*b)
# print(result)