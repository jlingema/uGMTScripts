from helpers.pattern_dumper import BufferWriter

def main():
    frame_writer = BufferWriter()
    link_writer = BufferWriter()

    links = [ k for k in range(72) ]

    for i in range(1024):
        words = [i]*72
        frame_writer.writeFrame(words)
        link_writer.writeFrame(links)


    with open("data/patterns/mp7/technical_framenumber.txt", 'w') as fobj:
        fobj.write(frame_writer.get_full_string())
    
    with open("data/patterns/mp7/technical_linknumber.txt", 'w') as fobj:
        fobj.write(link_writer.get_full_string())

if __name__ == "__main__":
    main()