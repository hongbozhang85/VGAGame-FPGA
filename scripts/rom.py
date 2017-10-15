import os

arr = [];

for files in os.listdir("."):
    
    if files.endswith(".txt"):
        
        fp = open(files)
        tmp = files.split(".")[0].lower()
        arr.append(tmp)
        fpout = open("pic_"+tmp+".v","w")
        fp.readline()
        fp.readline()
        fpout.write("`define " + tmp + " \\\n case (addr) \\\n")

        while 1:
            line = fp.readline()
            if not line:
                break
            loc, rgb = [x for x in line.split()]
            fpout.write("8'd" + loc + ":  tmp = 3'b" + rgb + "; \\\n")
            #print line

        fp.close()

        fpout.write("endcase\n")
        fpout.close()

        print("`include \"pic_" + tmp + ".v\"")

count = 0
for item in arr:
    print("\t\t4'd"+str(count)+": `"+item)
    count = count + 1
    
