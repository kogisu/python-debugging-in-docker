import sys
sys.path.append('src/')

from foo import blah

import debugpy

# Add the below 3 lines to enable remote debugging with debugpy
# port mapping in docker run & debug config must match
debugpy.listen(("0.0.0.0", 5678))
print("Waiting for client to attach...")
debugpy.wait_for_client()

def test_answer():
    blah.blah()
    assert True