# Time

# n은 0~23까지만 입력하는데, 입력한 값까지만 반복됨.
# 분과 초는 0~59까지 계속 반복하여 돌아가며
# 시간이 먼저 반복, 분 반복, 초 반복 순으로
# 각각을 10으로 나눴을 때, 나머지가 3이 나오는 것을 모두 더하면 될 듯

n = int(input())
result = 0
            
# 정답 1
# for i in range(n+1):
#     for j in range(60):
#         for k in range(60):
#             if i % 10 == 3 or j % 10 == 3 or k % 10 == 3 or i // 10 == 3 or j // 10 == 3 or k // 10 == 3:
#                 result += 1

# 정답 2
for i in range(n+1):
    for j in range(60):
        for k in range(60):
            if '3' in str(i) + str(j) + str(k):
                result += 1
            

# 오답 : i반복문이 3이 들어가면 한번 작동 후 다음 숫자로 넘어가기 때문에 오답.
#  i 반복문에 0, 1, 2, 3을 넣었을 때, i값이 3이면 모든 결과값에 3이 포함되는 상태이기에 출력값이 급증해야하는데 +1만 됨. 따라서 전체 결과에 반영해주기 위해서는 i와 j반복문에 있는 수식을 k반복문에 반영해줘야 함.
# for i in range(n+1):
#     if i % 10 == 3 or i // 10 == 3:
#         result += 1

#     for j in range(60):
#         if j % 10 == 3 or j // 10 == 3:
#             result += 1

#         for k in range(60):
#             if k % 10 == 3 or k // 10 == 3:
#                 result += 1

print(result)