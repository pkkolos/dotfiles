#!/bin/bash

# run X hotkey daemon
sxhkd &

exec bspwm
