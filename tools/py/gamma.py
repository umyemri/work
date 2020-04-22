import numpy as np
import math as ma
import os

i = input('transition: ')

def transition(red_s, red_e, gre_s, gre_e, blu_s, blu_e, gam_s, gam_e):
    red_iter = np.linspace(red_s, red_e, 10)
    green_iter = np.linspace(gre_s, gre_e, 10)
    blue_iter = np.linspace(blu_s, blu_e, 10)
    gamma_iter = np.linspace(gam_s, gam_e, 10)

    for i in range(10):
        command = 'sudo xrandr --output eDP-1 --gamma ' \
            + str(red_iter[i])[:3] + ':' \
            + str(green_iter[i])[:3] + ':' \
            + str(blue_iter[i])[:3] \
            + ' --brightness ' + str(gamma_iter[i])[:3]
        #print(command)
        os.system(command)

if (i == 'night'):
    transition(1.0, 1.1, 1.0, 0.8, 1.0, 0.6, 1.0, 0.6)
else:
    transition(1.1, 1.0, 0.8, 1.0, 0.6, 1.0, 0.6, 1.0)
