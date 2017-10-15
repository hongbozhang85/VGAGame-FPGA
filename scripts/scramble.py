############ fffefd...030201 ################
string = "2048'h"
for i in range(255,15,-1):
    string = string + str(hex(i)).lstrip("0x")
string = string + "0f0e0d0c0b0a09080706050403020100"
print("====initial configuration of a picture====")
print(string)


############ scramble left, imgScr ###########
# update 2048bit per clk cycle
string = "" 
string = string + "4'h0" + ":    "
tmp = "imgScr <= { imgScr[2047:128], imgScr[7:0], imgScr[127:8] };"
string = string + tmp + "\n"
for i in range(1,15):
    string = string + "4'h" + str(hex(i)).lstrip("0x") + ":    "
    bound1 = 128*i+128
    bound2 = 128*i+127
    bound3 = 128*i+8
    bound4 = 128*i+7
    bound5 = 128*i
    bound6 = 128*i-1
    tmp = "imgScr <= { imgScr[2047:" + str(bound1) + "], imgScr[" + str(bound4) + ":" + str(bound5) + "], imgScr[" + str(bound2) + ":" + str(bound3) + "], imgScr[" + str(bound6) + ":0] };"
    string = string + tmp + "\n"
string = string + "4'hf" + ":    "
tmp = "imgScr <= { imgScr[1927:1920], imgScr[2047:1928], imgScr[1919:0] };"
string = string + tmp + "\n"
# update only 128bit per clk cycle
string2 = "" 
string2 = string2 + "4'h0" + ":    "
tmp = "imgScr[127:0] <= { imgScr[7:0], imgScr[127:8] };"
string2 = string2 + tmp + "\n"
for i in range(1,15):
    string2 = string2 + "4'h" + str(hex(i)).lstrip("0x") + ":    "
    bound1 = 128*i+128
    bound2 = 128*i+127
    bound3 = 128*i+8
    bound4 = 128*i+7
    bound5 = 128*i
    bound6 = 128*i-1
    tmp = "imgScr[" + str(bound2) + ":" + str(bound5) + "] <= { imgScr[" + str(bound4) + ":" + str(bound5) + "], imgScr[" + str(bound2) + ":" + str(bound3) + "] };"
    string2 = string2 + tmp + "\n"
string2 = string2 + "4'hf" + ":    "
tmp = "imgScr[2047:1920] <= { imgScr[1927:1920], imgScr[2047:1928] };"
string2 = string2 + tmp + "\n"
print("=====left button in scramble mode=====")
#print(string)
print(string2)


############ scramble right, imgScr ############
# update 2048bit per clk cycle
string = ""
string = string + "4'h0" + ":    "
tmp = "imgScr <= { imgScr[2047:128], imgScr[119:0], imgScr[127:120] };"
string = string + tmp + "\n"
for i in range(1,15):
    string = string + "4'h" + str(hex(i)).lstrip("0x") + ":    "
    bound1 = 128*i+128
    bound2 = 128*i+127
    bound3 = 128*i+120
    bound4 = 128*i+119
    bound5 = 128*i
    bound6 = 128*i-1
    tmp = "imgScr <= { imgScr[2047:" + str(bound1) + "], imgScr[" + str(bound4) + ":" + str(bound5) + "], imgScr[" + str(bound2) + ":" + str(bound3) + "], imgScr[" + str(bound6) + ":0] };"
    string = string + tmp + "\n"
string = string + "4'hf" + ":    "
tmp = "imgScr <= { imgScr[2039:1920], imgScr[2047:2040], imgScr[1919:0] };"
string = string + tmp + "\n"
# update only 128 bits per clk cycle
string2 = ""
string2 = string2 + "4'h0" + ":    "
tmp = "imgScr[127:0] <= { imgScr[119:0], imgScr[127:120] };"
string2 = string2 + tmp + "\n"
for i in range(1,15):
    string2 = string2 + "4'h" + str(hex(i)).lstrip("0x") + ":    "
    bound1 = 128*i+128
    bound2 = 128*i+127
    bound3 = 128*i+120
    bound4 = 128*i+119
    bound5 = 128*i
    bound6 = 128*i-1
    tmp = "imgScr[" + str(bound2) + ":" + str(bound5) + "] <= { imgScr[" + str(bound4) + ":" + str(bound5) + "], imgScr[" + str(bound2) + ":" + str(bound3) + "] };"
    string2 = string2 + tmp + "\n"
string2 = string2 + "4'hf" + ":    "
tmp = "imgScr[2048:1920] <= { imgScr[2039:1920], imgScr[2047:2040] };"
string2 = string2 + tmp + "\n"
print("=====right button in scramble mode=====")
#print(string)
print(string2)

### a function
def inttohexstr(i):
    "int to string, in hex"
    if i == 0 :
        return "0"
    else :
        return str(hex(i)).lstrip("0x")

############# output logic of addr ###############
string = ""
for i in range(0,16): # arrowV loop
    for j in range(0,16): # arrowH loop
        string = string + "8'h" + inttohexstr(i) + inttohexstr(j) + ":    "
        tmp1 = 128*i + 8*j + 7
        tmp2 = 128*i + 8*j
        tmp = "addr <= imgScr[" + str(tmp1) + ":" + str(tmp2) + "];"
        string = string + tmp + "\\\n"
print("=====output: addr=====")
#print(string)
fp = open("outputAddr.v","w")
fp.write("`define outputaddr \\\n case ( {pixelV, pixelH} ) \\\n")
fp.write(string)
fp.write("endcase\n")
fp.close
print("write into file outputAddr.v")
#print(str(hex(0)).lstrip("0"))


############# scramble up, imgScr ############
string = ""
for i in range(0,16): # arrowH
    string = string + "4'h" + inttohexstr(i) + ":    \\\n\tbegin\\\n"
    for j in range(0,16): # row
        tmpj = (j + 15) % 16
        tmp1 = 8*i + 7 + 128*j
        tmp2 = 8*i + 128*j
        tmp3 = 8*i + 7 + 128*tmpj
        tmp4 = 8*i + 128*tmpj
        string = string + "\timgScr[" + str(tmp1) + ":" + str(tmp2) + "] <= imgScr[" + str(tmp3) + ":" + str(tmp4) + "];\\\n"
    string = string + "\tend\\\n"
#print(string)
fp = open("upImgScr.v","w")
fp.write("`define upImgScr \\\n case ( arrowH ) \\\n")
fp.write(string)
fp.write("endcase\n")
fp.close
print("=====up imgScr=======")
print("write into file upImgScr.v")


############# scramble down, imgScr ############
string = ""
for i in range(0,16): # arrowH
    string = string + "4'h" + inttohexstr(i) + ":    \\\n\tbegin\\\n"
    for j in range(0,16): # row
        tmpj = (j + 1) % 16
        tmp1 = 8*i + 7 + 128*j
        tmp2 = 8*i + 128*j
        tmp3 = 8*i + 7 + 128*tmpj
        tmp4 = 8*i + 128*tmpj
        string = string + "\timgScr[" + str(tmp1) + ":" + str(tmp2) + "] <= imgScr[" + str(tmp3) + ":" + str(tmp4) + "];\\\n"
    string = string + "\tend\\\n"
#print(string)
fp = open("downImgScr.v","w")
fp.write("`define downImgScr \\\n case ( arrowH ) \\\n")
fp.write(string)
fp.write("endcase\n")
fp.close
print("=====down imgScr=======")
print("write into file downImgScr.v")
