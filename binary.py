# x= 217
# binary=[]
# while x>0:
#     binary.append("1") if x%2==1 else binary.append("0")  
   
#     x= x//2
# print(("".join(binary))[::-1])

# x=270
# for x in range (x,0, x//2 ):
#     print(x)

sum_ = 10 
prod= 21

for i in range(0,sum_):
    for y in range(0,sum_):
        if ((i + y) == sum_ ) and (i*y == prod):
            print("Two numbers",i,y)
            exit()
        
       