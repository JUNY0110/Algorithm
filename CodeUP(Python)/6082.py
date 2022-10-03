# 6082

a = int(input())

for i in range(a):
    i += 1
    
    if i % 3 == 2 and 30 >= i > 20:
        i = "X"
    elif i % 3 == 1 and 20 >= i > 10:
        i = "X"
    elif i % 3 == 0 and 10 >= i > 0:
        i = "X"
    print(i, end = ' ')
    
for i in range(a):
    i += 1
    if i % 10 == 3 or i % 10 == 6 or i % 10 == 9:
        i = "X"
    print(i, end = ' ')