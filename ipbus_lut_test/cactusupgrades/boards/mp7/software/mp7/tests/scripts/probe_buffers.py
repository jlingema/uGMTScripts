#!/bin/env python

buf = mp7tester.buf

print 'scanning rx'
buf.getNode('buffers.rx_addr').write(0x0)
buf.getClient().dispatch()

for i in xrange(0x400):
	d = buf.getNode('buffers.rx_data').read()
	buf.getClient().dispatch()
	a = buf.getNode('buffers.rx_addr').read()
	buf.getClient().dispatch()
	print hex(a),':', hex(d)
