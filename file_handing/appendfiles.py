print("Before Appending")

with open("cat1.txt","w") as file1:
    file1.write("this is a new cat")
with open("cat1.txt","r") as file1:
    print(file1.read())
with open("cat2.txt","w") as file2:
    file2.write("this is a new cat2")
with open("cat2.txt","r") as file2:
    print(file2.read())

file2='cat2.txt'
print(f"After Appending in the file {file2}")

source_file='cat1.txt'
with open(source_file,"r") as x:
    reading_source_file=x.read()
destination_file='cat2.txt'
with open(destination_file,"a") as y:
    y.write("\n")
    y.write(reading_source_file)
with open(destination_file,"r") as y:
    print(y.read())
    y.close()
