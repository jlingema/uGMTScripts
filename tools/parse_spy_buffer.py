#!/bin/python
import muon_helpers
import argparse

def main():
    desc = 'Decodes uGMT spy buffer dumps.'
    parser = argparse.ArgumentParser(description=desc, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('bufferDumpFile', type=str, help='Path to buffer dump file.')

    opts = parser.parse_args()

    f = open(opts.bufferDumpFile, 'r')

    print_legend = True
    for line in f:
        bitwords = line.split(', ')

        # Finding first word to use.
        first_non_empty = 0
        for word in bitwords:
            # The second check here ensures that at least to LSB of pT has been set.
            if word[0:2] == "0x" and int(word[2:], 16) >= 1024:
                break
            first_non_empty += 1

        # Splitting into first and second words of muon
        first_parts = bitwords[first_non_empty+1::2]
        second_parts = bitwords[first_non_empty::2]

        for first_part, second_part in zip(first_parts, second_parts):
            muon = first_part[2:].strip() + second_part[2:].strip()
            # If the muon is empty we're not displaying it.
            if muon == "00":
                continue
            print muon_helpers.print_out_word(int(muon, 16), print_legend, True, False)
            print_legend = False

if __name__ == "__main__":
    main()
