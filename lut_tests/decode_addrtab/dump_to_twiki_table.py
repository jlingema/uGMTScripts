import argparse
import json
import uhal


def get_opts():
    parser = argparse.ArgumentParser(
        description="Decode address table to TWiki table format", formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument(dest="board", default="", type=str, help="name of connection node.")
    parser.add_argument("-c", "--connection", dest="connection", default="", type=str, help="filename connection file")
    parser.add_argument("-j", "--json", dest="config", default="", type=str, help="filename of json that configures which nodes to dump")
    parser.add_argument("-o", "--output", dest="output", default="", type=str, help="outputfile containing the twiki table")
    opts = parser.parse_args()
    return opts


def main():
    opts = get_opts()
    jobj = 0
    with open(opts.config, 'r') as fobj:
        jstring = fobj.read()
        jobj = json.loads(jstring)

    cm = uhal.ConnectionManager("file://"+opts.connection)
    board = cm.getDevice(opts.board)
    pload_nodes = board.getNode('payload').getNodes()

    nodes = {}
    for node_detail in jobj["nodes"]:
        if node_detail["name"] in pload_nodes:
            nodes[node_detail["name"]] = [node_detail["name"]]
        else:
            for n in pload_nodes:
                if node_detail["name"] in n:
                    if node_detail["name"] in nodes.keys():
                        nodes[node_detail["name"]].append(n)
                    else:
                        nodes[node_detail["name"]] = [n]

    row_template = "| {name} | {path} | {address} | {default} | {description} |\n"
    with open(opts.output, 'w') as fobj:
        for node_detail in jobj["nodes"]:
            if not node_detail["name"] in nodes.keys():
                print "Could not find node", node_detail["name"]
                fobj.write(row_template.format(
                    name=node_detail["name"],
                    path="n/a",
                    address="n/a",
                    default="n/a",
                    description=node_detail["cust_desc"]
                ))
            else:
                for node_name in nodes[node_detail["name"]]:
                    desc = node_detail["cust_desc"]
                    n = board.getNode('payload.{node_name}'.format(node_name=node_name))
                    if desc == "":
                        desc = n.getDescription()

                    desc_add = ""
                    if node_detail["subnode_mode"] != "":
                        desc_add += " ("
                        if node_detail["subnode_mode"] == "mask":
                            subnodes = n.getNodes()
                            for subnode in subnodes:

                                desc_add += subnode + " = x&0x{mask:X}, ".format(mask=board.getNode('payload.{node}.{subnode}'.format(node=node_name, subnode=subnode)).getMask())
                        desc_add += ")"
                    desc += desc_add
                    fobj.write(row_template.format(
                        name=node_detail["name"],
                        path="payload."+node_name,
                        address="0x{add:X}".format(add=n.getAddress()),
                        default="0x{default:X}".format(default=node_detail["default"]),
                        description=desc
                    ))

if __name__ == "__main__":
    main()
