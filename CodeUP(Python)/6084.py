# 6084

h, b, c, s = map(int,input().split())
volume = h * b * c * s / 8 / 1024 / 1024

print(round(volume, 1), "MB", sep = ' ')