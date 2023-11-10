f1=open('file1.txt','w')
f1.write('\nThis file is before append')
f1.close()

f2=open('file2.txt','w')
f2.write('This file is after append\n')
f2.close()

#Open the file to read the content to append
source_file_name = 'file1.txt'
with open(source_file_name, 'r') as file_to_append:
    content_to_append = file_to_append.read()

# Open the file to which you want to append content
destination_file_name = 'file2.txt'
with open(destination_file_name, 'a') as destination_file:
    # Append the content read from the source file
    destination_file.write(content_to_append)




