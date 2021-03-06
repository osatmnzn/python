#python startup file
import sys
import readline
import rlcompleter
import atexit
import os
# tab completion
readline.parse_and_bind('tab:complete')
#history file
histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
try:
    readline.read_history_file(history)
except IOError:
    pass
atexit.register(readline.write_history_file, histfile)

