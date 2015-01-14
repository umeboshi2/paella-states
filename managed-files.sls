#!pydsl
# -*- mode: python -*-
import os

# Check if the file exists and download it
def check_downloaded_file(id, filename, source, source_hash,
                          verify_hash=False, **kwarg):
    mfile = state(id)
    if os.path.exists(filename) and not verify_hash:
        mfile.file('exists', filename)
    else:
        mfile.file('managed',
                   source=source,
                   source_hash=source_hash,
                   name=filename,
                   makedirs=True,
                   **kwarg)

resources = __pillar__.get('internet_resources') 
for resource_id in resources:
    filename = resources[resource_id]['name']
    source = resources[resource_id]['source']
    source_hash = resources[resource_id]['source_hash']
    check_downloaded_file(resource_id, filename, source, source_hash)
    

