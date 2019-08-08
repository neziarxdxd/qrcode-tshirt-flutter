
colour = ['black', 'brown','red', 'orange', 'yellow','green', 'blue', 'violet']
tolerance = {'brown': 1, 'red': 2, 'green':0.5, 'blue': .25, 'violet':.1, "grey":.05, "gold":5, "silver":10, "None": 20 }
multiplier= {"gold":-1, "silver": -2}
code= ('yellow violet blue silver').split(" ")
# get the first two color band 
digit= int(str(colour.index(code[0])) +  str(colour.index(code[1])) )

#choose number for exponent( ^ )
if code[2] in multiplier:
    m=multiplier.get(code[2]) 
else: 
    m= colour.index(code[2])
# digit * 10^m compute for the zeros     
y= digit * (10 **m )

print("Colors: "+ "-".join(code))
print("Compute: {} * 10^{} ".format(digit,m))
print("Resistance: {} ohms".format(y))
#this compute for the tolerance percentage 
tolerance_percentage=  (y* (tolerance.get(code[3]) *.01) )

print("tolerance percentage: {}".format(tolerance_percentage))
#Maximum and minimum tolerance 
print("Maximum tolerance: {} ".format(y+tolerance_percentage ))
print("Minimum tolerance: {} ".format(y-tolerance_percentage))


#Validation Area
# if (code[0:2] not in colour) and (code[2] not in colour+list(multiplier.keys())) and (code[4] not in list(tolerance.keys())):
#     print("Check the first two color")