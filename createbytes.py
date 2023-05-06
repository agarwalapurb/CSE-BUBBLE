file = open("bin.txt", "r")
filebyte = open("byte.txt", "w")
lines = file.readlines()
c = 0
for line in lines:
    for i in range(4):
        newbyte = "\tmem[" + str(c) + "] <= 8'b" + line[8*i:8*i+8] + ";\n"
        filebyte.write(newbyte)
        c+=1
file.close()
filebyte.close()

