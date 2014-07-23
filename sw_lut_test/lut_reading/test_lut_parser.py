#!/usr/bin/env python

from lut_configurator import LUTConfigurator

if __name__ == "__main__":
    fname = "data/test_lut_file.json"
    cfg = LUTConfigurator(fname)

    print "full lut1: ", cfg.get_lut("TOP.payload.lut1")
    print "full lut2: ", cfg.get_lut("TOP.payload.lut2")

    print "lut1 data instance1:", cfg.get_lut_instance_data("TOP.payload.lut1", "instance1")
    print "lut2 data:", cfg.get_lut_data("TOP.payload.lut2")

    print "lut1 data (all instances):", cfg.get_lut_data("TOP.payload.lut1")

    print "8 randoms, 5 bit:", [hex(x) for x in LUTConfigurator.get_randoms(8, 5)]
    print "8 zeroes:", LUTConfigurator.get_zeroes(8)
    print "8 ones:", LUTConfigurator.get_ones(8)

    sine_data = LUTConfigurator.get_sin_lut(8, 32)
    print "sinus as data (addrwidth=8, datawidth=32):", [hex(x) for x in sine_data]



    print ""
    LUTConfigurator.get_2param_function_lut("a+b", 5, 6, 5)

    # from ROOT import TH1D, TCanvas
    # max_val = pow(2, 8)
    # h = TH1D("", "", max_val, 0, max_val)
    # # max_val = pow(2, 32)
    # for x in range(max_val):
    #     h.SetBinContent(x, sine_data[x])

    # cv = TCanvas()
    # h.Draw("LP")
    # cv.Print("sinus_test.pdf")