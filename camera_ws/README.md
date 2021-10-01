# Camera Workspace
## Current space to test and debug camera module

If camera workspace is saying memory is limited, using following command in terminal:
'''
sudo tee /sys/module/usbcore/parameters/usbfs_memory_mb >/dev/null <<<0
'''


## Things to do
 [x] Get ximea package working
 [x] Get Fiducial package working
 [x] Detect position of aruco blocks
 [ ] Correctly determine colour of ROIs
 [ ] Correctly identify block position and colour