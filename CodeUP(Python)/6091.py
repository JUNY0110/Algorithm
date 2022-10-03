# 6091

a, b, c = map(int, input().split())

#a, b, c 의 공통배수르 찾아라.
# 어떤 수로 나눴을 때, 2개 이상이 공통으로 나눠지는 수가 없어야 한다.

d = 1

while d%a != 0 or d%b != 0 or d%c != 0:
    d += 1
print(d)