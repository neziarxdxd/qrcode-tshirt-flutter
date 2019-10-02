#Database 
days = {"Monday":{}, "Tuesday":{}, "Wednesday":{}, "Thursday":{},"Friday":{} }
def printDays():
#This is for printing the Day
    for day in days:
        print(day+"\n---------")
        for x,y in days.get(day).items():
            y= sorted(y)        
            print((str(int(x))+":{minute}-"+str(int(y[0]))+":{minute}").format(minute="30" if (x%1==.5)else "00"),
            '{:>12} {:>8} {:>12}'.format(y[1], y[2], y[3] ))
        print()


def enterData():
    subject_code = input("Enter the subject code")
    start , end = (input("Enter time separate with (,) ")).split(",")
    sub_day = input("Enter the Day: ").split(",") 
    room = input("Enter the room: ")
    units= int(input("Number of Units: "))
    #This is for inserting the data 
    for i in sub_day:
        # Monday : { start_time: [end_time, subject code, room] }
        days[i] = {int(start): [int(end), subject_code, room, int(units)]}



                           


        

    
    
     
    
