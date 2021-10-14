# Set to home
# INITIALISE:
match ibisState:
    case SEARCHING:
        # Move home
        if cubeFound is True:
            cubePose = get_cube_pose()
            """ Receive cube pose from the camera """
            # ik_pub(cubePose)
            ibisState = ControlState.CALCULATE_IK
    case CALCULATE_IK:
        """ request IK """
        if targetJSReceived is True:
            ibisState = ControlState.MOVE_OVER_CUBE
            # publish jointstate to trajectory
            trajectoryComplete = False
    case MOVE_OVER_CUBE:
        if trajectoryComplete is True:
            ibisState = ControlState.MOVE_DOWN
            # publish jointstate to trajectory
            trajectoryComplete = False
    case DOWN_PICKUP:
        if trajectoryComplete is True:
            ibisState = ControlState.CLAW_PICKUP
            # publish jointstate to trajectory
            trajectoryComplete = False
    case CLAW_PICKUP:
        if trajectoryComplete is True:
            ibisState = ControlState.UP_PICKUP
            # publish jointstate to trajectory
            trajectoryComplete = False
    case UP_PICKUP:
        if trajectoryComplete is True:
            ibisState = ControlState.CUBE_HOME
            # publish jointstate to trajectory
            trajectoryComplete = False
    case CUBE_HOME:
        # get the colour home
        if trajectoryComplete is True:
            ibisState = ControlState.DOWN_DROP
            # publish jointstate to trajectory
            trajectoryComplete = False
    case DOWN_DROP:
        if trajectoryComplete is True:
            ibisState = ControlState.CLAW_DROP
            # publish jointstate to trajectory
            trajectoryComplete = False
    case CLAW_DROP:
        if trajectoryComplete is True:
            ibisState = ControlState.UP_DROP
            # publish jointstate to trajectory
            trajectoryComplete = False
    case UP_DROP:
        if trajectoryComplete is True:
            ibisState = ControlState.SEARCHING
            # publish jointstate to trajectory
            trajectoryComplete = False