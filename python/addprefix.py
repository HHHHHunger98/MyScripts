import os

# directory/folder path
# change the path for use and decomment the following line
# dir_path = r'/home/hhhhhunger/study/MA/MA_Papers'

# index of the file prefix 
index = 1

# Iterate directory
for file_path in os.listdir(dir_path):
    # check if current file_path is a file
    file_to_rename = os.path.join(dir_path, file_path)
    if os.path.isfile(file_to_rename):
        os.rename(file_to_rename, os.path.join(dir_path, str(index) + '_' + file_path))
        index += 1
