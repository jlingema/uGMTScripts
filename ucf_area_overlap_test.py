from tools.logger import log
import logging
class Rect(object):
    """A minimal class for rectangles that allows overlap checking"""
    def __init__(self, x, y, w, h, typ, name, modifier=1):
        """ Modifier for RAMB18 being half-sized RAMB36 -- should be one for all except RAMB36"""
        super(Rect, self).__init__()
        self.height = h*modifier
        self.y = y*modifier
        self.width = w
        self.x = x
        self.right = self.x+self.width
        self.left = self.x
        self.bottom = self.y
        self.top = self.y+self.height
        self.typ = typ
        self.name = name

        self.y_true = y
        self.height_true = h
        
    def test_overlap_with(self, rect):
        """ If you prefer to call on an instance """
        Rect.test_overlap(self, rect)

    @staticmethod
    def range_overlap(a_min, a_max, b_min, b_max):
        """ Check whether two ranges overlap: Neither range is truly greater"""
        return not ((a_min > b_max) or (b_min > a_max))

    @staticmethod
    def test_overlap(rect1, rect2):
        """ Tests overlap between two rectangles, checking the x-axis ranges and y-axis ranges;
        Only works for axis-aligned rectangles, wich is always the case for our purposes"""
        if rect1.name == rect2.name:
            return False
        return Rect.range_overlap(rect1.left, rect1.right, rect2.left, rect2.right) and Rect.range_overlap(rect1.bottom, rect1.top, rect2.bottom, rect2.top)

    def __str__(self):
        return "{name} [{typ}] (X{x1}Y{y1}:X{x2}Y{y2})".format(name=self.name, typ=self.typ, x1=self.left, y1=self.y_true, x2=self.right, y2=self.y_true+self.height_true)

def parse_options():
    import optparse
    usage = '''
%prog filename [options]
'''

    parser = optparse.OptionParser( usage )
    parser.add_option('-v', '--verbosity', dest='verbosity', help='Set verbosity-level, possible values: DEBUG, INFO, WARNING, ERROR (%default)', default="DEBUG", type='string')

    opts, args = parser.parse_args()
    if len(args) != 1:
        _log.error("Please provide an input file")
        print usage
        exit(0)
    
    return opts, args

def get_rect_from_ucf(ucf_string, line_no):
    """ 
    Quick and dirty parser for ucf AREA_GROUP definitions:
    Bsp: AREA_GROUP cou_fo_plus RANGE=SLICE_X30Y300:SLICE_X105Y349;
    """
    # Check whether the line is commented and then ignore
    if ucf_string.lstrip()[0] == "#":
        return []
    # First get rid of keywords and instance name 
    rects_txt = ucf_string.split("RANGE=")[1]
    # disjunct groups are separated by ','
    rect_txt_list = rects_txt.split(",")

    # get the type of the AREA_GROUP -- only considering SLICE or RAMB18/36
    typ = "SLICE"
    modifier = 1
    if "RAMB18" in ucf_string:
        typ = "RAMB18"
    if "RAMB36" in ucf_string:
        modifier = 2
        typ = "RAMB36"

    rects = []
    name = ucf_string.split()[1]

    for rect in rect_txt_list:
        begin, end = rect.split(":")
        try:
            xb = int(begin.split("X")[1].split("Y")[0].strip().replace(";", ""))
            yb = int(begin.split("Y")[1].strip().replace(";", ""))
            xe = int(end.split("X")[1].split("Y")[0].strip().replace(";", ""))
            ye = int(end.split("Y")[1].strip().replace(";", ""))
        except ValueError:
            _log.error("ValueError: in line {}: Parser failed. Expected int following X/Y found something else, skipping line:".format(line_no))
            print "\t\t", ucf_string
            return []
        rects.append(Rect(xb, yb, xe-xb, ye-yb, typ, name, modifier))
    return rects

def test_rect_list(rect_list):
    found_overlap = False
    for i, rect1 in enumerate(rect_list):
        # the overlap is symmetric, only have to check once
        for j, rect2 in enumerate(rect_list[i:]):
            if i == j: continue
            overlap = Rect.test_overlap(rect1, rect2)
            if overlap:
                _log.error("{rect1} and {rect2}".format(rect1=rect1, rect2=rect2))
                found_overlap = True
    return found_overlap

_log = log.init_logging("ucf-test")
if __name__ == "__main__":
    # initialize command line input
    opts, args = parse_options()

    # set verbosity according to option
    log.set_level(opts.verbosity)
    _log.debug ("*"*40)
    _log.info ("  UCF Overlap Tester")
    _log.info ("*"*40)
    _log.warning("Only AREA GROUPS are tested!")

    f = open(args[0], 'r')
    ram_rects = []
    slice_rects = []
    for line_no, line in enumerate(f):
        if "AREA_GROUP" in line:
            if "SLICE" in line:
                slice_rects += get_rect_from_ucf(line, line_no)
            if "RAM" in line:
                ram_rects += get_rect_from_ucf(line, line_no)
    f.close()

    _log.info("Found {} (SLICE) + {} (RAMB18/36) area-constraints.".format(len(slice_rects), len(ram_rects)))
    
    # check both RAM and SLICE for overlaps:
    found_overlap_ram = test_rect_list(ram_rects)
    found_overlap_slice = test_rect_list(slice_rects)

    if found_overlap_ram or found_overlap_slice:
        _log.info("Found conflicts (see print-outs above), fix and re-check!")
    else:
        _log.info("Found no conflicts.")