import exifread


# Example 002
def show_image_detail():
    # rb for opening image in binary
    file = open('images/2019-03-18-153433.jpg', 'rb')
    tags = exifread.process_file(file)

    print('Details:')
    for t in tags:
        print(t.ljust(32), ':', tags[t])

    file.close()


show_image_detail()
