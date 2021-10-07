# importing sys to import files from different folders
import sys
sys.path.insert(0, '') #hierarchy -> '/home/user/folders'
sys.path.insert(0, '')
sys.path.insert(0, '')
sys.path.insert(0, '')
  
# import all py files from different packages  
from import * 
from import *
from import *
from import *

def main():
    
    # 1. Receive current pos from the servo (Dynamixel)
    
    # 2. Receive cube pos and target pos from the camera
    
    # 3. Inverse kinematics, receive joint matrices
    
    # 4. Send joint matrices from IK to trajectories planning
    
    # 5. Trajectories planning 
    
    # 6. Send joint matrices (pos, velocity) from TP to servo (Dynamixel)
    
    # 7. Servo (Dynamixel) moves to cube pos
    
    # 8. Current pos = new pos, receive current pos
    
    # 9. loop from #1?
    
    # 10. If Completion = True: servo (SG90) moves (grip)
    
    # 11. Loop from #1 to #8 for target pos
    
    # 12. If Completion = True: servo (SG90) moves (drop)
    
    # 13. Loop from #1 to #8 for cube pos
    
    
if __name__ == "__main__":
    main()
