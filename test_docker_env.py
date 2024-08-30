#!/usr/bin/env python3
# coding: utf-8
import math
import MatterSim
print('Mattersim import ok')
import torch
print('librerias import ok')


# check MatterSim ok
WIDTH = 640
HEIGHT = 480
VFOV = 60
sim = MatterSim.Simulator()
sim.setRenderingEnabled(False)
sim.setCameraResolution(WIDTH, HEIGHT)
sim.setCameraVFOV(math.radians(VFOV))
sim.setDiscretizedViewingAngles(True)
# sim.init()
# sim.newEpisode('ZMojNkEp431', '2f4d90acd4024c269fb0efe49a8ac540', 0, math.radians(-30))
# sim.makeAction(0, 1.0, 1.0)
print('MatterSim use ok')

# check GPU ok
if torch.cuda.is_available():
    device_count = torch.cuda.device_count()
    print(f"Number of available GPUs: {device_count}")
    for i in range(device_count):
        print(f"GPU {i}: {torch.cuda.get_device_name(i)}")
else:
    print("No GPUs available. Running on CPU.")