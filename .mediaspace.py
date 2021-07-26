#!/usr/bin/python

import os
import time
import json

tmpFile = ".cur_workspaces_status.tmp"

workspaces = json.loads(str(os.popen('i3-msg -t get_workspaces').readlines()[0]))

curData = {
        "curWorkspaceName": "",
        "curWorkspaceOutput": "",
        "jumpWorkspace": "-",
        "mediaOutput": ""
}

for x in workspaces:
    if x["name"] == "1":
        curData["mediaOutput"] = x["output"]
    if x["focused"]:
        curData["curWorkspaceName"] = x["name"]
        curData["curWorkspaceOutput"] = x["output"]

print(curData)

# if currently on mediaspace restore
if curData["curWorkspaceName"] == "1":
    f = open(tmpFile, "r")
    restoreData = json.loads(f.read())

    if restoreData["jumpWorkspace"] != "-":
        os.system('i3-msg workspace ' + restoreData["jumpWorkspace"])

    os.system('i3-msg workspace ' + restoreData["curWorkspaceName"])

# if not on mediaspace, open it
else:
    if curData["curWorkspaceOutput"] != curData["mediaOutput"]:
        # switch to mediaOutput
        os.system('i3-msg focus output ' + curData["mediaOutput"])

        # save jump workspace
        tmpWorkspaces = json.loads(str(os.popen('i3-msg -t get_workspaces').readlines()[0])) 
        for x in tmpWorkspaces:
            if x["focused"]:
                curData["jumpWorkspace"] = x["name"]

    # write current state to file to enable reversion later on
    f = open(tmpFile, "w")
    f.write(json.dumps(curData))
    f.close()

    # only invoke workspace switch if mediaspace not currently active
    # needed to circumvent problems with i3's auto back and forth feature
    if curData["jumpWorkspace"] != "1":
        os.system('i3-msg workspace 1')
