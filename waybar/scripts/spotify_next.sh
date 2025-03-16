#!/bin/bash

playerctl -l | grep -q spotify || exit 0
echo '{"text": "⏭", "tooltip": "Next"}'

