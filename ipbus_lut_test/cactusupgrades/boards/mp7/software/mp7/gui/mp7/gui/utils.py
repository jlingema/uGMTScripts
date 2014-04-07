import inspect

'''

'''

class HwProxy:

    def __init__(self, device, lock=False ):
        self._device  = device
        self._lock    = lock

    def __getattr__(self,name):
        attr = getattr(self._device,name)
        if not inspect.ismethod(attr): return HwProxy(attr, self._lock)
        else: return HwMethodProxy( attr, not self._lock)


class HwMethodProxy:

    def __init__(self, method, valid):
        self._valid  = valid
        self._method = method

    def __call__(self, *args, **kwargs):
        if not self._valid:
            raise AttributeError('The board is locked')
        else:
            return self._method(*args, **kwargs)


class HwResult:

    def __init__(self,value,valid=True):
        self.value = value
        self.valid = valid


