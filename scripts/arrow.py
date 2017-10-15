fp = open("pic_arrow.v","w")
fp.write("`define arrow \\\n case (counter) \\\n")

for i in range(0,30): # row
    for j in range(0,30): # col
        loc = str(i*30 + j)
        rgb = "111"
        if i < 10 :
            if j >14 and j < 15 + i :
                rgb = "000"
        elif  i < 20  :
            if j < 30 - abs(15-i):
                rgb = "000"
        else:
            if j > 14 and j < 45 - i:
                rgb = "000"
        fp.write("10'd" + loc + ":  arrowImg = 3'b" + rgb + "; \\\n")

fp.write("endcase\n")
fp.close()
