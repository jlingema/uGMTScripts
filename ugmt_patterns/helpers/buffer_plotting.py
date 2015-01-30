import ROOT

def create_and_fill_muon_hists(hist_parameters, muon_list, pfix):
    hist_dict = {}
    for var, options in hist_parameters.iteritems():
        hist_dict[var] = ROOT.TH1D(var+"_{pfix}".format(pfix=pfix), "", options[1], options[2], options[3])

    for mu in muon_list:
        # only plot non-zero muons!
        if mu.bitword == 0: continue
        hist_dict["qualityBits"].Fill(mu.qualityBits)
        hist_dict["ptBits"].Fill(mu.ptBits)
        hist_dict["phiBits"].Fill(mu.phiBits)
        hist_dict["etaBits"].Fill(mu.etaBits)
    return hist_dict

def create_and_fill_rank_hist(rank_list, pfix):
    hist = ROOT.TH1D("rank_{pfix}".format(pfix=pfix), "", 512, 0, 512)
    for rnk in rank_list:
        # only plot non-zero muons!
        hist.Fill(rnk)
    return hist

def set_legend_style(legend):
    legend.SetFillColor(ROOT.kWhite)
    legend.SetLineColor(0)
    legend.SetTextFont(42)
    legend.SetTextSize(0.04)
    legend.SetFillStyle(0)
    legend.SetLineStyle(0)
    legend.SetLineWidth(0)
    legend.SetBorderSize(0)

def set_text_style(txt):
    txt.SetNDC()
    txt.SetTextFont(42)
    txt.SetTextSize(0.04)

def plot_modifier(hist, xlabel, ylabel, color, marker_style=None, fillstyle=1001):
    hist.GetXaxis().SetTitle(xlabel)
    hist.GetYaxis().SetTitle(ylabel)
    if not marker_style == None:
        hist.SetMarkerStyle(marker_style)
        hist.SetMarkerColor(color)
    hist.SetLineColor(color)
    hist.SetFillStyle(fillstyle)
    if color != ROOT.kBlack:
        hist.SetFillColor(color)