
num = [2,5,6,7,10,3]
n=len(num)-1
for i in range(n):
    for x in range(n-i):
        if num[i] + num[n-x] == 8:
            print("The numbers are",i,n-x)
        
        
    


'''
01 02 03 04
12 13 14
23 24
34

'''