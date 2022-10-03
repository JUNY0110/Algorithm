# 6043

a, b = map(float, input().split())
print(round(a / b, 3)) # 소수점 아래 0을 절삭하기 때문에 사용에 주의하자.
print(format(a/b, ".3f")) #소수점 아래 0을 살린다. 3.000 등으로 표현 가능