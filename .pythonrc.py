# coding=utf-8
import sys, platform
implementation = platform.python_implementation()

sys.ps1 = '%s >>> ' % implementation
sys.ps2 = '...  '
