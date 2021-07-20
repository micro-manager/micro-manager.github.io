__NOTOC__
Most difficulties in working with Micro-Manager arise from configuring the system and from problems/issues with specific devices.  In both of these cases you are interacting mainly with device adapters.  These device adapters have been written by several different authors, all behave slightly differently, and interact with specific hardware that has its own peculiarities.  On these pages we will maintain as much information as possible about Micro-Manager device adapters.  This will help you configure and understand your Micro-Manager system.  We hope that the authors of the device adapters will maintain this information, but please feel free to update the information here with your own experiences.  The information here will refer to the [[Download_Micro-Manager_Latest_Release|most recent Micro-Manager release]].

=== Motorized Microscopes ===
* [[LeicaDMI]] - Leica DMI and DM microscopes
* [[LeicaDMR]] - Leica DMR microscopes (and DMIRBE)
* [[MoticMicroscope]] - Motic BA600 microscopes
* [[NikonAZ100]] - Nikon AZ100 Zoom microscope
* [[NikonEclipse90i]] - Nikon Eclipse 90i motorized microscope
* [[NikonTE2000]] - Nikon TE2000 motorized microscope
* [[NikonTI]] - Nikon Ti microscope
* [[NikonTi2]] - Nikon Ti2 microscope
* [[Olympus]] - Olympus IX81 (Inverted)/BX61 (Upright)
* [[OlympusIX83]] - Olympus IX83 motorized microscope
* [[ZeissCAN]] - Zeiss CAN-bus (not CAN29) compatible microscopes (Axiovert 200m, Axioplan2)
* [[ZeissCAN29]] - Zeiss CAN29-bus compatible microscopes (AxioObserver)
* [[ZeissAxioZoom]] - Zeiss AxioZoom microscope (CAN29)

=== Cameras ===
* [[ABSCamera]] - Cameras from ABS Gesellschaft für Automatisierung, Bildverarbeitung, Software GmbH Jena
* [[AmScope]] - AmScope MU series cameras (Windows)
* [[Andor]] - Andor cameras (CCD and EMCCD)
* [[AndorSDK3]] - New model Andor cameras (sCMOS)
* [[Apogee]] - Apogee cameras
* [[AxioCam]] - Zeiss AxioCam medium resolution and high resolution models (Windows)
* [[BaslerAce]] - Basler Ace USB Cameras
* [[BaslerCameras]] - All Basler cameras that are supported by pylon SDK
* [[BaumerOptronic]] - Leica DFC camera (through BaumerOptronic FXLib)
* [[BiostepEagleIce]] - biostep EagleIce camera
* [[dc1394]] - Firewire cameras that adhere to the iidc1394 specs (see also [[IIDC]])
* [[DECamera]] - Direct Electron Cameras
* [[DemoCamera]] - Virtual, emulated equipment for testing
* [[Dhyana]] - Dhyana/Tucsen cameras
* [[DSLRRemoteCamera]] - Canon DSLR cameras (Windows)
* [[FakeCamera]] - Virtual camera that loads images from disk (Windows, Linux)
* [[FirstLightImagingCamera]] - First Light Imaging Cameras
* [[FLICamera]] - Finger Lakes Instrumentation Cameras
* [[GigECamera]] - GigE Vision- and GenICam-compliant cameras
* [[GPhoto]] - Canon and Nikon DSLR cameras (Mac, Linux)
* [[Hamamatsu]] - Legacy adapter for Hamamatsu cameras (via DCAM-API); now Mac only
* [[HamamatsuHam]] - Hamamatsu cameras (via DCAM-API)
* [[IDS_uEye]] - IDS uEye USB cameras (also Thorlabs DCUxxxx, Edmund EO-xxxxM) (Linux, Windows)
* [[IIDC]] - Firewire (and USB) cameras compatible with the IIDC specification (see also [[dc1394]])
* [[JAI]] - JAI Cameras (eBUS)
* [[BaumerOptronic|Leica Cameras]] - These use the [[BaumerOptronic]] adapter
* [[Lumenera]] - Lumenera cameras
* [[MatrixVision|MATRIX VISION devices]] - MATRIX VISION GmbH USB3 Vision, GigE Vision and USB2 cameras as well as various frame grabber boards
* [[Micropix]] - Cameras from Micropix
* [[Mightex_C_Cam]] - Mightex C-series USB cameras
* [[MoticCamera]] - Motic cameras
* [[NKRemoteCamera]] - Nikon Digital SLR (Windows)
* [[OpenCVgrabber]] - Supports numerous USB cameras and frame grabbers (those using a DirectShow or WDM class driver). (Windows)
* [[PCO_Camera]] - Supports all pco.sdk based cameras (pco.edge, pco.panda and others)
* [[Photometrics]] - A.k.a. [[PVCAM]]
* [[PICAM]] - Princeton Instruments cameras using the PICam interface
* [[Piper]] - Stanford Photonics cameras
* [[Pixelink]] - Pixelink Cameras
* [[Point Grey Research]] - Point Grey (now FLIR) cameras through the Flycap2 interface, also see [[Spinnaker]]
* [[PrincetonInstruments]] - Princeton Instruments cameras
* [[ProgRes]] - Jenoptik cameras (ProgRes series)
* [[PSRemoteCamera]] - Canon PowerShot camera (Windows)
* [[PVCAM]] - Roper/Photometrics cameras (not for Princeton Instruments)
* [[PVCAM legacy]] - pre-2021 documentation for Roper/Photometrics cameras
* [[QCam]] - QImaging cameras
* [[QSICamera]] - QSI cameras (Windows)
* [[RaptorEPIX]] - Raptor Photonics cameras using EPIX cameralink board
* [[ScionCam]] - Scion cameras
* [[Sensicam]] - PCO/Cooke Sensicam camera
* [[SigmaKoki]] - Sigma Koki camera
* [[Spinnaker]] - FLIR (formally Point Grey) cameras though the Spinnaker interface
* [[SpotCamera]] - Diagnostic Instruments Spot cameras
* [[TetheredCam]] - Canon and Nikon DSLR cameras (Windows)
* [[ThorlabsUSBCamera]] - Thorlabs cameras (Windows)
* [[TIScam]] - The Imaging Source cameras (tested on USB/CCD models) and video frame grabbers
* [[TSI]] - Thorlabs Scientific Imaging Cameras
* [[TwainCamera]] - Cameras fully implementing Twain Imaging Standard
* [[Veroptics]] - Veroptics cameras
* [[Video4Linux]] - Video4Linux compatible cameras
* [[XIMEACamera]] - XIMEA cameras (and some Olympus Soft Imaging cameras)
<br>

=== Stages, filter wheels, shutters ===   
* [[ArduinoNeoPixel]] - Adafruit NeoPixel RGB LEDs controlled through an Arduino
* [[ASIFW1000]] - ASI Shutter and Filter Wheel controller
* [[ASIStage]] - ASI XY (and Z) stage and CRIF
* [[ASITiger]] - ASI TG-1000 "Tiger" Controller (hub device, peripherals include multiple stage types, filter wheel, shutters, micro-mirrors, etc.)
* [[ChuoSeiki_MD5000]] - ChuoSeiki MD5000 series controller: 2-axis, single axis
* [[ChuoSeiki_QT]] - ChuoSeiki QT series controller: 3-axis, 2-axis, single axis
* [[CoolLED]] - LED illuminator (usable as a shutter device)
* [[CONEX]] - See NewportCONEX
* [[Conix]] - Conix Filter Changer, XY and Z stage
* [[Corvus]] - M&auml;rzh&auml;user XY stages with Corvus driver.
* [[DA-Z-Stage]] - For stages that can be controlled with analogue voltage.  Needs a DA device
* [[DAShutter]] - Treats a DA output as a shutter.  Useful (for instance) for diode lasers
* [[IntelLiDrive]] - IntelLiDrive stages are support through 3d party adapters
* [[KDV]] - kdvelectronics focus drive (z-stage) for Meiji Techno
* [[LeicaDMSTC]] - Leica DMSTC XY stage
* [[LMT200-V3]] - ITK Dr. Kassen LMT200-V3 HYDRA Controller and XY stage
* [[Ludl]] - Ludl stages, shutters and filter wheels 
* [[LudlLow]] - Ludl stages, shutters and filter wheels (other)
* [[Marzhauser]] - M&auml;rzh&auml;user XY stages and Z (uses TANGO controller)
* [[MarzhauserLStep]] - M&auml;rzh&auml;user LStep stage controller
* [[MarzhauserLStepOld]] - Old version (1.2) of M&auml;rzh&auml;user LStep stage controller
* [[MCL_MicroDrive]] - Mad City Labs MicroDrive
* [[MCL_NanoDrive]] - Mad City Labs NanoDrive
* [[MT20]] - Olympus MT20 illumination source (Lamp/shutter/filter wheel)
* [[MP285]] - Sutter Micro-Manipulator
* [[NewportCONEX]] - Newport CONEX-CC servo controller
* [[NewportSMC]] - Newport SMC100 single-axis motor controller
* [[Nikon]] - Nikon Z-drive, TIRF shutter and IntensiLight shutter
* [[NIMotionStage]] - National Instruments FlexMotion stage controls
* [[NPointC400]] - nPoint C.400 and LC.400 axis controllers
* [[ObjectiveImaging]] - Objective Imaging OASIS controller
* [[PI_GCS_2]] - Physik Instrumente (PI) GCS2 adapter
* [[PI_GCS]] - Physik Instrumente (PI) GCS adapter - Z Stage connected to PI GCS controller (E-665, E-621, E-625, E-753, ...)
* [[PI]] - Other (older) Physik Instrumente devices.  Includes the E-662 controller
* [[PicardStage]] - Picard Industries USB Slide I/II and USB Twister
* [[PIEZOCONCEPT]] - PIEZOCONCEPT nanopositioners
* [[Piezosystem_30DV50]] - Piezosystem Jena. digital one channel controller
* [[Piezosystem_dDrive]] - Piezosystem Jena. digital 6 channel controller with display
* [[Piezosystem_NV40_1]] - Piezosystem Jena. one channel controller for older stages
* [[Piezosystem_NV40_3]] - Piezosystem Jena. 3 channel controller with USB
* [[Piezosystem_NV120_1]] - Piezosystem Jena. 1 channel controller with USB
* [[PrecisExcite]] - LED illuminator (usable as a shutter device)
* [[Prior]] - Prior stages, shutters, and filter wheels
* [[PriorNano]] - Prior/Queensgate nanopositioning stages
* [[RAMPS]] - RepRap RAMPS board as a stage controller
* [[Scientifica]] - Scientifica stages
* [[ScopeLED]] - DiCon LED-powered brightfield and fluorescence microscopy illuminators, implemented as shutters. 
* [[SigmaKoki]] - Sigma Koki stages and shutters
* [[SmarActHCU-3D]] - HCU and CU SmarAct controllers adapter (XY and Z)
* [[SouthPort_MicroZ]] - SouthPort MicroZ stage controller
* [[Standa]] - Standa Microstep Driver
* [[StandaStage]] - Standa Microstep Driver
* [[Standa8SMC4]] - Standa Microstep Driver (using XIMC interface)
* [[SutterLambda]] - Sutter Shutters, filter wheels, light sources, etc..
* [[SutterLambda2]] - Sutter Lambda 10-3 controller, shutters, filter wheels, and VF5 tunable filter
* [[SutterStage]] - Sutter XY Stage
* [[Thorlabs]] - Thorlabs XY Stage (brushless DC motor), Piezo Z Stage and Integrated Filter Wheel
* [[ThorlabsAPTStage]] - Thorlabs APT family linear stages
* [[ThorlabsDCStage]] - Thorlabs Linear Stages using the TDC001 Controller (see also: [[ThorlabsAPTStage]])
* [[ThorlabsDCxxxx]] - Thorlabs LED controllers
* [[ThorlabsElliptecSlider]] - Thorlabs Elliptec sliders ELL6, ELL9, ELL17 and ELL20.
* [[ThorlabsFilterWheel]] - Thorlabs Filter Wheel
* '''ThorlabsKinesis''' - Thorlabs Kinesis motor controllers ([https://github.com/micro-manager/mmdev-ThorlabsKinesis separate download & instructions])
* [[ThorlabsMFC1]] - Thorlabs MFC1 Motorized Microscope Focus Controller
* [[ThorlabsSC10]] - Thorlabs shutter controller
* [[Tofra]] - XY and Z stages, filter wheel, motorized filter cube slider, and LED illuminator
* [[UserDefinedSerial]] - Shutters and state devices that can be controlled with simple serial commands
* [[Vincent]] - Vincent Uniblitz controllers
* [[WieneckeSinske]] - WSB PiezoDrive CAN XY stage
* [[Xcite]] - EXFO X-Cite 120 PC Fluorescent Lamp / Shutter
* [[XCite120PC_Exacte]] - Lumen Dynamics X-Cite 120PC and ''exacte'' adapter
* [[XCiteLed]] - LED controller
* [[XCiteXT600]] - X-Cite TURBO and XT600 series
* [[Zaber]] - Zaber linear and XY stages, filter wheels

=== Communication ports, TTLs, DAQs, etc. ===
* [[Arduino]] - Open Source Programmable Digital/Analogue IO board
* [[Arduino32bitBoards]] - 32bit Open Source Programmable Digital/Analogue IO boards
* [[CustomArduino]] - Arduino-based devices matching existing device adapters
* [[DTOpenLayer]] - DT OpenLayer Digital IO boards
* [[ESIOImagingControllers]] - Microcontrollers for hardware triggering and synchronization
* [[FreeSerialPort]] - Communicate directly through a serial port
* [[ITC18]] - controls shutters, cameras, pifocs, anything that can use either a TTL signal or a ±10 V signal
* [[K8055]] - Velleman Digital IO board (all platforms)
* [[K8061]] - Velleman Digital IO board (all platforms)
* [[MCCDAQ]] - Measurement Computing PCI-DDA08/16
* [[MicroFPGA]] - Open source FPGA platform for hardware triggering and control
* [[National Instruments]] - See NI100X and NIMultiAnalog
* [[NicoLase]] An open-source diode laser combiner, fiber launch, and sequencing controller for fluorescence microscopy
* [[NI100X]] - NI I/O boards - DAQmx interface
* [[NIMultiAnalog]] - NI boards with multiple analog outputs
* [[SerialManager]] - Serial Ports on Windows
* [[SerialManagerUnix]] - Serial Ports on Mac and Linux
* [[TriggerScope]] - TriggerScope digital and analog controller
* [[TriggerScopeMM]] - TriggerScope v3 with Micro-Manager firmware
* [[ParallelPort]] - TTLs on parallel port (Windows only)
* [[USBManager]] - Micro-Manager internal USB communications driver

=== Light sources ===
* [[89NorthLDI]] - Laser Diode Illuminator from 89 North
* [[AgilentLaserCombiner]] - Agilent MLC
* [[AndorLaserCombiner]] - Andor laser launch
* [[BlueboxOptics_niji]] - Bluebox Optics niji 7 channel LED light source
* [[CoboltOfficial]] - Cobolt lasers 06-01 Series, Cobolt Skyra
* [[Cobolt]] - Cobolt laser controller
* [[CoherentCube]] - Coherent CUBE laser controller
* [[CoherentOBIS]] - Coherent OBIS laser controller (Single Laser Remote)
* [[Coherent Scientific Remote]] - Coherent OBIS laser controller (Scientific Remote and Single Laser Remote)
* [[LaserQuantumLaser]] - gem/ventus/opus/axiom series from LaserQuantum
* [[Lumencor Light Engine]] - All Lumencor Light Engine models
* [[LumencorSpectra]] - Solid state illuminator from Lumencor
* [[Mightex]] - LED driver/controllers
* [[Mightex_BLS]] - BLS Control Modules
* [[MightexPolygon]] - Mightex Polygon multiwavelength patterned illuminators
* [[Omicron]] - Omicron Laser Controller
* [[Oxxius]] - Oxxius Laser Controller
* [[Oxxius_combiner]] - Oxxius combiner; hub for multiple laser sources
* [[PolychromeV]] - Illumination system from Till Photonics
* [[Prairie Aurora Laser Launch]] - Prairie Aurora Laser Launch Interfacing using a [[Velleman K8061]]
* [[Sapphire]] - Lasers from Coherent
* [[Skyra]] - Skyra laser controller
* [[Stradus]] - Vortran Stradus laser driver
* [[Toptica_iBeamSmartCW]] - Toptica iBeamSmart laser series
* [[Toptica_iChrome_MLE]] - Toptica iChrome Multi Laser Engine
* [[Toptica_iChrome_MLE_TCP]] - Toptica iChrome Multi Laser Engine over TCP link
* [[USB_Viper_QPL]] - Excelitas/Qioptiq iFLEX-Viper Laser Engine
* [[Versalase]] - Vortran Versalase laser driver
* [[YodnLighting]] - YODN Lighting lamp device adapter for E600 serial products

=== Other devices ===
* [[AAAOTF]] - AOTF controller from AA Optoelectronics
* [[Aladdin]] - Syring pump controller from Aladdin
* [[AndorShamrock]] - Andor Shamrock Spectrographs
* [[Aquinas]] - Aquinas Microfluidics Controller
* [[Neos|AOTF]] - NEOS AOTF control through parallel port.  Can be used for any TTL-controllable shutter
* [[ASIwptr]] - ASI well-plate transfer robot
* [[CARVII]] - BD/CrEST CARV II spinning disk confocal
* [[Diskovery]] - Spectral/Andor spinning disk confocal/TIRF module 
* [[DLP4000]] - Digital Mirror Device
* [[GenericSLM]] - Any spatial light modulator that can be controlled via computer video output port.
* [[ImageProcessorChain]] - Virtual device driver for processing images in C++
* [[LumencorCIA]] - Camera synchronization for the Lumencor Spectra
* [[MaestroServo]] - Pololu Maestro Servo controller
* [[MicroPoint]] - Galvo-based phototargeting device from Andor
* [[Mosaic3]] - Andor Mosaic DMD Projection Device
* [[Okolab]] - Okolab Microscope Incubators and Gas Controllers
* [[OVP_ECS2]] - Optic Valley Photonics ECS-2 environmental controller
* [[Pecon]] - Pecon Incubation System
* [[PeCon2000]] - PeCon 2000 Incubation Controllers (USB-connected)
* [[pgFocus]] - Open Software/Hardware Focus Stabilization from [http://big.umassmed.edu BIG]
* [[Rapp]] - Rapp UGA40 photobleaching/photoactivation unit
* [[SimpleAutofocus]] - Image-based autofocus software 'device'.
* [[SpectralLMM5]] - Spectral laser line controller
* [[SutterMPC]] - Multi manipulator controller
* [[Utilities]] - Virtual devices providing extra functionality to Micro-Manager
* [[VariLC]] - Tunable liquid crystal polarization modulators from CRi
* [[VisiTech_iSIM]] - VisiTech iSIM
* [[Yokogawa]] - Yokogawa CSU22
* Yokogawa [[CSUW1]] - Yokogawa CSUW1
* Yokogawa [[CSUX]] - Yokogawa CSUX
* [[XLight]] - CrestOptics X-Light spinning disc confocal system
* The [http://goochandhousego.com/product/hsi-300-hyperspectral-imaging-system/ HSi-300 Hyperspectral Imager] can be controlled with Micro-Manager (not yet included in the distribution, contact Gouch & Housego for details)

{{Devices_Sidebar}}
