# 6079

a = int(input())
sum = 0

for i in range(a):
    sum += i
    if sum >= a:
        print(i)
        break