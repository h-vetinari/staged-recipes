#!/bin/bash
if [ -z $PMIP_CBC_LIBRARY ]; then
    export CONDA_BACKUP_PMIP_CBC_LIBRARY=$PMIP_CBC_LIBRARY
fi

export PMIP_CBC_LIBRARY=$PREFIX/lib/libCbc${SHLIB_EXT}
