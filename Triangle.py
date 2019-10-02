n=10
x=0
for j in range (1,n+1):
    
    for i in range (1,(n*2)+1):
       
        if x==n-1:
            print("*"*((n*2)-1),end="")
            break
        elif i==n-x or i==n+x:
            
            print("*",end="")
        else:
            print(" ",end="")
    x+=1    
    print()
    