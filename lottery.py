def bingo(ticket,win):
    y=0
    
    for i in ticket:
        if (chr(i[1]) in (i[0])):
            y+=1


    return 'Winner!' if y==win else 'Loser!'

print(bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2))