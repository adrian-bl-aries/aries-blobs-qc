#!/bin/sh

SB="vendor/qcom/prebuilt/proprietary"

echo "PRODUCT_COPY_FILES += \\"
(
  cd proprietary ;
  for workdir in adreno/a3xx msm8974 ; do
    XB="$SB/$workdir"
    cd $workdir
    find * -type f | sort | awk '{print "    '$XB'/" $1 ":" $1 " \\" }'
    cd - > /dev/null
  done
)
echo
