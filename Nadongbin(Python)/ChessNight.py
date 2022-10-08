# # ChessNight

# # 정답 1
# c = input()
    
# h_list = ['a','b','c','d','e','f','g','h']
# v_list = ['1','2','3','4','5','6','7','8']

# result = 0
# for i in range(len(h_list)):
#     for j in range(len(v_list)):
#         if c == h_list[i] + v_list[j]:
#             if i + 2 < 8 and j + 1 < 8:
#                 result += 1
#             if i + 1 < 8 and j + 2 < 8:
#                 result += 1
#             if i + 2 < 8 and j - 1 > 0:
#                 result += 1
#             if i + 1 < 8 and j - 2 > 0:
#                 result += 1    
#             if i - 2 > 0 and j + 1 < 8:
#                 result += 1
#             if i - 1 > 0 and j + 2 < 8:
#                 result += 1    
#             if i - 2 > 0 and j - 1 > 0:
#                 result += 1
#             if i - 1 > 0 and j - 2 > 0:
#                 result += 1
#     # if i-2 < 0 or i + 2 > 8 or j-2 < 0 or j + 2 > 8:
#     #     continue

# print(result)

# 정답 2
input_data = input()
row = int(input_data[1])
column = int(ord(input_data[0]) - int(ord('a'))) + 1

steps = [(-2, -1), (-1, -2),(1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1)]

answer = 0

for step in steps:
    next_row = row + step[0]
    next_column = column + step[1]
    if next_row >= 1 and next_row <= 8 and next_column >= 1 and next_column <= 8:
        answer += 1

print(answer)


