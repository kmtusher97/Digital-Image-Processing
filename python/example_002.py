import exifread

def showImageDetail():
    #rb for opening image in binary
    file = open('images/ashick.jpg', 'rb')
    tags = exifread.process_file(file)

    print('Details:')
    for t in tags:
        print (t.ljust(32), ':', tags[t])

showImageDetail()
