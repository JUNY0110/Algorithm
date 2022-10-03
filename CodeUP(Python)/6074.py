# 6074

c = ord(input()) # 문자를 숫자로 변환
a = ord('a')

while c >= a:
    print(chr(a), end = ' ') # 숫자를 문자로 변환
    a += 1
