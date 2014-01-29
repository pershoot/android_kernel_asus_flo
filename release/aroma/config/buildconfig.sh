#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/glitch-settings.conf"

#MINFREQ
if [ -f "/tmp/aroma/minfreq.prop" ];
then
MINF=`cat /tmp/aroma/minfreq.prop | cut -d '=' -f2`
echo -e "\n\n##### Minimum frequency #####\n# 1 162 MHz" >> $CONFIGFILE
echo -e "# 2 270 MHz\n# 3 384 MHz (stock)\n# 4 594 MHz\n# 5 810 MHz\n" >> $CONFIGFILE
if [ $MINF = 1 ]; then
  echo "MINF=1" >> $CONFIGFILE;
elif [ $MINF = 2 ]; then
  echo "MINF=2" >> $CONFIGFILE;
elif [ $MINF = 4 ]; then
  echo "MINF=4" >> $CONFIGFILE;
elif [ $MINF = 5 ]; then
  echo "MINF=5" >> $CONFIGFILE;
else
  echo "MINF=3" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Minimum frequency #####\n# 1 162 MHz" >> $CONFIGFILE
echo -e "# 2 270 MHz\n# 3 384 MHz (stock)\n# 4 594 MHz\n# 5 810 MHz\n" >> $CONFIGFILE
echo "MINF=3" >> $CONFIGFILE;
fi

#HOTPLUGDRV
if [ -f "/tmp/aroma/hotplug.prop" ];
then
HOTPLUGDRV=`cat /tmp/aroma/hotplug.prop | cut -d '=' -f2`
echo -e "\n\n##### Hotplug driver Settings #####\n# 0 to enable qualcomm mpdecision (stock)" >> $CONFIGFILE
echo -e "# 1 to enable msm_mpdecision (recommended)\n# 2 to enable intelli-plug\n" >> $CONFIGFILE
if [ $HOTPLUGDRV = 2 ]; then
  echo "HOTPLUGDRV=1" >> $CONFIGFILE;
elif [ $HOTPLUGDRV = 3 ]; then
  echo "HOTPLUGDRV=2" >> $CONFIGFILE;
else
  echo "HOTPLUGDRV=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Hotplug driver Settings #####\n# 0 to enable qualcomm mpdecision (stock)" >> $CONFIGFILE
echo -e "# 1 to enable msm_mpdecision (recommended)\n# 2 to enable intelli-plug\n" >> $CONFIGFILE
echo "HOTPLUGDRV=0" >> $CONFIGFILE;
fi

#S2W
if [ -f "/tmp/aroma/S2WS.prop" ];
then
S2W=`grep "item.0.1" /tmp/aroma/S2WS.prop | cut -d '=' -f2`
S2S=`grep "item.0.2" /tmp/aroma/S2WS.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2Wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep2wake and sweep2sleep (default)\n# 2 to enable sweep2sleep and disable sweep2wake\n" >> $CONFIGFILE
if [ $S2W = 1 ]; then
  echo "SWEEP2WAKE=1" >> $CONFIGFILE;
elif [ $S2S = 1 ]; then
  echo "SWEEP2WAKE=2" >> $CONFIGFILE;
else
  echo "SWEEP2WAKE=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Sweep2Wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep2wake and sweep2sleep (default)\n# 2 to enable sweep2sleep and disable sweep2wake\n" >> $CONFIGFILE
echo "SWEEP2WAKE=0" >> $CONFIGFILE;
fi

#PWR_TOGGLE
if [ -f "/tmp/aroma/S2WS.prop" ];
then
PWR_TOGGLE=`grep "item.0.3" /tmp/aroma/S2WS.prop | cut -d '=' -f2`
echo -e "\n\n##### S2W/DT2W power button toggle Settings #####\n# 0 to disable S2W/DT2W power button toggle" >> $CONFIGFILE
echo -e "# 1 to enable S2W/DT2W power button toggle\n" >> $CONFIGFILE
if [ $PWR_TOGGLE = 1 ]; then
  echo "PWR_TOGGLE=1" >> $CONFIGFILE;
else
  echo "PWR_TOGGLE=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### S2W/DT2W power button toggle Settings #####\n# 0 to disable S2W/DT2W power button toggle" >> $CONFIGFILE
echo -e "# 1 to enable S2W/DT2W power button toggle\n" >> $CONFIGFILE
echo "PWR_TOGGLE=0" >> $CONFIGFILE;
fi

#Shortsweep
if [ -f "/tmp/aroma/S2WS.prop" ];
then
SHORTSWEEP=`grep "item.0.4" /tmp/aroma/S2WS.prop | cut -d '=' -f2`
echo -e "\n\n##### Shortsweep Settings #####\n# 0 to disable Shortsweep" >> $CONFIGFILE
echo -e "# 1 to enable Shortsweep\n" >> $CONFIGFILE
if [ $SHORTSWEEP = 1 ]; then
  echo "SHORTSWEEP=1" >> $CONFIGFILE;
else
  echo "SHORTSWEEP=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Shortsweep Settings #####\n# 0 to disable Shortsweep" >> $CONFIGFILE
echo -e "# 1 to enable Shortsweep\n" >> $CONFIGFILE
echo "SHORTSWEEP=0" >> $CONFIGFILE;
fi

#DT2W
if [ -f "/tmp/aroma/S2WS.prop" ];
then
DT2W=`grep "item.0.5" /tmp/aroma/S2WS.prop | cut -d '=' -f2`
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n" >> $CONFIGFILE
if [ $DT2W = 1 ]; then
  echo "DT2WAKE=1" >> $CONFIGFILE;
else
  echo "DT2WAKE=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n" >> $CONFIGFILE
echo "DT2WAKE=0" >> $CONFIGFILE;
fi

#S2S_ORIENTATION
if [ -f "/tmp/aroma/orientation.prop" ];
then
S2S_ORIENTATION=`cat /tmp/aroma/orientation.prop | cut -d '=' -f2`
echo -e "\n\n##### S2S orientation Settings #####\n# 0 for both" >> $CONFIGFILE
echo -e "# 1 for portrait only\n# 2 for landscape only\n" >> $CONFIGFILE
if [ $S2S_ORIENTATION = 2 ]; then
  echo "S2S_ORIENTATION=1" >> $CONFIGFILE;
elif [ $S2S_ORIENTATION = 3 ]; then
  echo "S2S_ORIENTATION=2" >> $CONFIGFILE;
else
  echo "S2S_ORIENTATION=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### S2S orientation Settings #####\n# 0 for both" >> $CONFIGFILE
echo -e "# 1 for portrait only\n# 2 for landscape only\n" >> $CONFIGFILE
echo "S2S_ORIENTATION=0" >> $CONFIGFILE;
fi

#Magnetic on/off
if [ -f "/tmp/aroma/misc.prop" ];
then
LID=`grep "item.0.1" /tmp/aroma/misc.prop | cut -d '=' -f2`
echo -e "\n\n##### Magnetic on/off Settings #####\n# 0 to disable Magnetic on/off" >> $CONFIGFILE
echo -e "# 1 to enable Magnetic on/off\n" >> $CONFIGFILE
if [ $LID = 1 ]; then
  echo "LID=0" >> $CONFIGFILE;
else
  echo "LID=1" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Magnetic on/off Settings #####\n# 0 to disable Magnetic on/off" >> $CONFIGFILE
echo -e "# 1 to enable Magnetic on/off\n" >> $CONFIGFILE
echo "LID=1" >> $CONFIGFILE;
fi

#USB Host mode charging
if [ -f "/tmp/aroma/misc.prop" ];
then
OTGCM=`grep "item.0.2" /tmp/aroma/misc.prop | cut -d '=' -f2`
echo -e "\n\n##### USB OTG+Charge Settings ######\n# 1 to enable USB host mode charging\n# 0 to disable USB host mode charging\n" >> $CONFIGFILE
if [ $OTGCM = 1 ]; then
  echo "OTGCM=1" >> $CONFIGFILE;
else
  echo "OTGCM=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### USB OTG+Charge Settings ######\n# 1 to enable USB host mode charging\n# 0 to disable USB host mode charging\n" >> $CONFIGFILE
echo "OTGCM=0" >> $CONFIGFILE;
fi

#Input-boost
if [ -f "/tmp/aroma/misc.prop" ];
then
INPUTBOOST=`grep "item.0.3" /tmp/aroma/misc.prop | cut -d '=' -f2`
echo -e "\n\n##### Input-booster Settings ######\n# 1 to enable Input-boost\n# 0 to disable Input-boost\n" >> $CONFIGFILE
if [ $HOTPLUGDRV = 1 ]; then
  echo "INPUTBOOST=0" >> $CONFIGFILE;
elif [ $INPUTBOOST = 1 ]; then
  echo "INPUTBOOST=1" >> $CONFIGFILE;
else
  echo "INPUTBOOST=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Input-booster Settings ######\n# 1 to enable Input-boost\n# 0 to disable Input-boost\n" >> $CONFIGFILE
echo "INPUTBOOST=0" >> $CONFIGFILE;
fi

#Gentle Fair Sleepers
if [ -f "/tmp/aroma/misc.prop" ];
then
GFSLEEPERS=`grep "item.0.4" /tmp/aroma/misc.prop | cut -d '=' -f2`
echo -e "\n\n##### Gentle Fair Sleepers Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
if [ $GFSLEEPERS = 1 ]; then
  echo "GFSLEEPERS=1" >> $CONFIGFILE;
else
  echo "GFSLEEPERS=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Gentle Fair Sleepers Settings ######\n# 1 to enable\n# 0 to disable\n" >> $CONFIGFILE
echo "GFSLEEPERS=0" >> $CONFIGFILE;
fi

#THERMAL
if [ -f "/tmp/aroma/thermal.prop" ];
then
THERM=`cat /tmp/aroma/thermal.prop | cut -d '=' -f2`
echo -e "\n\n##### Thermal Settings #####\n# 0 for default thermal throttling" >> $CONFIGFILE
echo -e "# 1 to run cool\n# 2 to run hot\n" >> $CONFIGFILE
if [ $THERM = 1 ]; then
  echo "THERM=1" >> $CONFIGFILE;
elif [ $THERM = 3 ]; then
  echo "THERM=2" >> $CONFIGFILE;
else
  echo "THERM=0" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Thermal Settings #####\n# 0 for default thermal throttling" >> $CONFIGFILE
echo -e "# 1 to run cool\n# 2 to run hot\n" >> $CONFIGFILE
echo "THERM=0" >> $CONFIGFILE;
fi

#GPU Clock
if [ -f "/tmp/aroma/gpuclock.prop" ];
then
GPU_OC=`cat /tmp/aroma/gpuclock.prop | cut -d '=' -f2`
echo -e "\n\n##### Max GPU Clock #####\n# 1 320 MHz" >> $CONFIGFILE
echo -e "# 2 400 MHz\n# 3 450 MHz\n# 4 504MHz\n# 5 545 MHz\n# 6 600 MHz\n# 7 627 MHz\n" >> $CONFIGFILE
if [ $GPU_OC = 1 ]; then
  echo "GPU_OC=1" >> $CONFIGFILE;
elif [ $GPU_OC = 3 ]; then
  echo "GPU_OC=3" >> $CONFIGFILE;
elif [ $GPU_OC = 4 ]; then
  echo "GPU_OC=4" >> $CONFIGFILE;
elif [ $GPU_OC = 5 ]; then
  echo "GPU_OC=5" >> $CONFIGFILE;
elif [ $GPU_OC = 6 ]; then
  echo "GPU_OC=6" >> $CONFIGFILE;
elif [ $GPU_OC = 7 ]; then
  echo "GPU_OC=7" >> $CONFIGFILE;
else
  echo "GPU_OC=2" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Max GPU Clock #####\n# 1 320 MHz" >> $CONFIGFILE
echo -e "# 2 400 MHz\n# 3 450 MHz\n# 4 504MHz\n# 5 545 MHz\n# 6 600 MHz\n# 7 627 MHz\n" >> $CONFIGFILE
echo "GPU_OC=2" >> $CONFIGFILE;
fi

#GPU Governor
if [ -f "/tmp/aroma/gpugov.prop" ];
then
GPU_GOV=`cat /tmp/aroma/gpugov.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Governor #####\n# 1 Ondemand (default)" >> $CONFIGFILE
echo -e "# 2 Interactive\n# 3 Performance\n" >> $CONFIGFILE
if [ $GPU_GOV = 2 ]; then
  echo "GPU_GOV=2" >> $CONFIGFILE;
else
  echo "GPU_GOV=1" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### GPU Governor #####\n# 1 Ondemand (default)" >> $CONFIGFILE
echo -e "# 2 Interactive\n# 3 Performance\n" >> $CONFIGFILE
echo "GPU_GOV=1" >> $CONFIGFILE;
fi

#GPU UV
if [ -f "/tmp/aroma/gpuuv.prop" ];
then
GPU_UV=`cat /tmp/aroma/gpuuv.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Undervolting #####\n# 1 Stock\n# 2 -25mV" >> $CONFIGFILE
echo -e "# 3 -50mV\n# 4 -75mV\n# 5 -100mV\n# 6 -125mV\n# 7 -150mV\n" >> $CONFIGFILE
if [ $GPU_UV = 2 ]; then
  echo "GPU_UV=2" >> $CONFIGFILE;
elif [ $GPU_UV = 3 ]; then
  echo "GPU_UV=3" >> $CONFIGFILE;
elif [ $GPU_UV = 4 ]; then
  echo "GPU_UV=4" >> $CONFIGFILE;
elif [ $GPU_UV = 5 ]; then
  echo "GPU_UV=5" >> $CONFIGFILE;
elif [ $GPU_UV = 6 ]; then
  echo "GPU_UV=6" >> $CONFIGFILE;
elif [ $GPU_UV = 7 ]; then
  echo "GPU_UV=7" >> $CONFIGFILE;
else
  echo "GPU_UV=1" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### GPU Undervolting #####\n# 1 Stock\n# 2 -25mV" >> $CONFIGFILE
echo -e "# 3 -50mV\n# 4 -75mV\n# 5 -100mV\n# 6 -125mV\n# 7 -150mV\n" >> $CONFIGFILE
echo "GPU_UV=1" >> $CONFIGFILE;
fi

#Battery life extender
if [ -f "/tmp/aroma/ble.prop" ];
then
BLE=`cat /tmp/aroma/ble.prop | cut -d '=' -f2`
echo -e "\n\n##### Battery life eXtender #####\n# 1 4.3V (stock - 100%)" >> $CONFIGFILE
echo -e "# 2 4.2V (balanced - 93%)\n# 3 4.1V (conservative - 83%)\n# 4 4.0V (very conservative - 73%)\n" >> $CONFIGFILE
if [ $BLE = 2 ]; then
  echo "BLE=2" >> $CONFIGFILE;
elif [ $BLE = 3 ]; then
  echo "BLE=3" >> $CONFIGFILE;
elif [ $BLE = 4 ]; then
  echo "BLE=4" >> $CONFIGFILE;
else
  echo "BLE=1" >> $CONFIGFILE;
fi
else
echo -e "\n\n##### Battery life eXtender #####\n# 1 4.3V (stock - 100%)" >> $CONFIGFILE
echo -e "# 2 4.2V (balanced - 93%)\n# 3 4.1V (conservative - 83%)\n# 4 4.0V (very conservative - 73%)\n" >> $CONFIGFILE
echo "BLE=1" >> $CONFIGFILE;
fi

echo -e "\n\n##############################" >> $CONFIGFILE
#END
