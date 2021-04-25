#!/usr/bin/python

import os
import time

while(True):

    # left channel
    left = int(os.popen('amixer sget Master | grep "Front Left:"').readlines()[
            0].split("[")[1].split("%")[0])
    # print("left: " + str(left))

    # right channel
    right = int(os.popen('amixer sget Master | grep "Front Right:"').readlines()[
                0].split("[")[1].split("%")[0])
    # print("right: " + str(right))

    unified = (left+right)/2
    # print("unified: " + str(unified))
    # print("unified mod 5: " + str(unified % 5))

    if (unified % 5 < 2.5):
        unified = int(unified - unified % 5)
    else:
        unified = int(unified - unified % 5) + 5

    # print("corrected unified: " + str(unified))

    os.system('amixer -q sset Master ' + str(unified) + '%')

    time.sleep(5)