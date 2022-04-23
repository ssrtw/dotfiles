import os
import gdb


class MyAt (gdb.Command):
    """Myself implement at command."""

    def __init__(self):
        super(MyAt, self).__init__("at", gdb.COMMAND_USER)

    def invoke(self, arg, from_tty):
        curr_exe = gdb.progspaces()[0].filename
        pids = [i for i in os.listdir('/proc') if i.isdigit()]
        last_pid = ''
        for pid in pids:
            if not os.access(path='/proc/%s/exe' % pid, mode=os.R_OK):
                continue
            if os.readlink(path='/proc/%s/exe' % pid) == curr_exe:
                last_pid = pid
        if last_pid == '':
            print('Argument required (process-id to attach).')
        else:
            gdb.execute('attach %s' % last_pid)


MyAt()
