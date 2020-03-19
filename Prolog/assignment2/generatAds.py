import random
toPrint = ""
for i in range(1, 40, 2):
    toPrint+=(str("(" + str(i) + ", 'this is an add/"+str(random.randint(10000, 99999)) + "'), "))
    toPrint+=(str("(" + str(i+1) + ", 'this is another add/"+str(random.randint(10000, 99999)) + "'), "))
print(toPrint)
