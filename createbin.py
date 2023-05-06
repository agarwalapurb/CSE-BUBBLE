# arr = [5]
arr = [20, 2, 5, 4, 2, 10, 6, 9, 0, 8, 25, 69, 14, 81, 80, 56, 62, 44, 23, 10, 18, 89]
def generatebin(num):
    # print(num)
    s = ""
    while num>0 :
        r = num%2
        # print(r)
        s = str(r)+s
        num = int(num/2)
    k = 32-len(s)
    for i in range(k):
        s = "0" + s
    # print(s)
    return s+"\n"
file = open("bin.txt", "w")
lines = [generatebin(num) for num in arr]
# for line in lines:
#     print(line)
file.writelines(lines)
