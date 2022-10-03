# 6086

a = int(input())
sum = 0


for i in range(a+1):
    i += 1
    sum += i
    if sum >= a:
        break
print(sum)