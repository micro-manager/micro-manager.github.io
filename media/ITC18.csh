#!/bin/csh -f
# 


if ( $#argv <  5 ) then
	echo "% tesm_advanced_imaging.csh [-sets <number>] [-TIRF] [-EPI] Shutter(TTL #) FilterWheel(0-9) Images Exposure(ms) Interval(ms)..." 
	echo ""
	echo ""
	echo "	Use -sets <number> if you want a repeatable pattern, otherwise, do not use the option. "
	echo "	<number> can be anything from 1 to something very large. "

	echo "	"
	echo "	Use -EPI to activate the epifluoresence optical pathway.  "
	echo "	Use -TIRF to activate the TIRF optical pathway. (default)"
	echo "		-EPI and -TIRF must come after -sets! "
	echo "	"

	echo ""
	echo "	Rate will be assumed to be 1Khz for the Instrutech ITC-18."
	echo "	Read channel will be assumed to be on TTL 0."
	echo ""
	echo ""
	echo "	This protocol will accept multiple shutter/filter/image/exposure/interval to allow you to generate burst imaging."
	echo "	Use the -sets option to repeat a series. -sets will apply to everything after, until a new sets option is used. " 
	echo ""
	echo ""
	echo "	The Sutter Filter wheel controller 10-2 is connected from its parallel port to pins 27,29,31,33,35,37,39,41 on the  "
	echo "	the back of the ITC18 Digitial I/O top connector. Any ground pin can be used. We use pin 42."
	echo "	This corresponds to TTL bits 8-15 (0 indexed)"
	echo "  "
	echo " 	FILTER POSISTIONS: "
	echo "	===================== "
	echo "	Filter 0 is OPEN "
	echo " 	Filter 1 is 525/50 "
	echo "	Filter 2 is 640/40 "
	echo "	Filter 3 is 710/50 "
	echo "	Filter 4 is 585/LP "
	echo "	Filter 5 is 672/LP "
	echo "	====================== "
	echo ""
	echo "	Moving between adjacent filter positions will take atleast 50ms. "
	echo "	Moving two positions will take atleast 100ms. "
	echo "	Check the chart on the wall for how long it takes to change filters. "
	echo ""
	echo "	SHUTTERS #:	|	Laser	|	Time to remain open"
	echo "	================================================================ "
	echo "	Shutter -1	| 	disable shutter "
	echo ""
	echo "	Shutter  1	| 	491 Laser	| 	exposure + ( 2 * shutterday) "
	echo "	Shutter  2	| 	561 Laser	| 	exposure + ( 2 * shutterday) "
	echo "	Shutter  3	| 	660 Laser	| 	exposure + ( 2 * shutterday) "
	echo ""
	echo "	Shutter  11	| 	491 Laser	| 	interval "
	echo "	Shutter  12	| 	561 Laser	| 	interval "
	echo "	Shutter  13	| 	660 Laser	| 	interval "
	echo "	================================================================ "
	echo " 	"
	echo ""
	echo "	1.5"
	echo "	Date:  7/16/2009"
	echo ""
     echo "	By Karl Bellve"
     echo ""
	exit
endif

# convert microns into volts. 1 Volt = 10 microns

# 0 indexed to match the TTL numbers on the ITC18
set rate 	  = "1"
set read_ttl	  = "0"
set tirf_ttl	  = "4"
set epi_ttl	  = "5"

# The TTL graphs are bit graphs.
# Add 1 if you want to activate TTL Out 1, add 2 if you want to activate TTL Out 2, etc
# TTL Out 1 is set for Camera Read
# TTL Out 2 is set for Shutter 1. Shutter is open when TTL is high.

set bitlist = ( 1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 32768 65536 )
set filterlist = ( 256 512 768 1024 1280 1536 1792 2048 )
# we add one to shutter_ttl and read_ttl because lists in csh are 1 indexed while the TTL themselves are 0 indexed
@ read_ttl++
@ tirf_ttl++
@ epi_ttl++
@ read = $bitlist[$read_ttl]
@ tirf = $bitlist[$tirf_ttl]

set sets = 1
set TOTALTICKS = 0
set X = 1
set images = 0
set total_images = 0
set exposure = 0
set interval = 0
set shutter_delay = 2

set SHUTTER_A = 0
set SHUTTER_B = 0
set SHUTTER_C = 0
set channels = 0

while ( $X < $#argv )
	# need to determine total number of ticks by parsing the command like and check images, exposure, and interval
	# determine if -sets is present

	if ( "$argv[$X]" == "-sets" ) then
                @ X++
                set sets = $argv[$X]
                if ( ${sets} < 1 )  then
                        echo " WARNING: -sets is less than 1! "
                        exit
                endif
                @ X++
	 endif

     
	 if ( "$argv[$X]" == "-EPI" ) then
		@ X++
	endif

	if ( "$argv[$X]" == "-TIRF" ) then
		@ X++
	endif

	set shutter_ttl = $argv[$X]
	
	if ( $shutter_ttl > 10 ) then
		@ shutter_ttl -= 10
	endif
	
	if ( $shutter_ttl == 1 ) then
		set SHUTTER_A = 1 
	endif
    
	if ( $shutter_ttl == 2 ) then
		set SHUTTER_B = 1
	endif
	
	if ( $shutter_ttl == 3 ) then
		set SHUTTER_C = 1
	endif

	@ X++
	set filter_ttl = $argv[$X]
	@ X++
	set images = $argv[$X]
	@ total_images += ( $images * $sets )
	@ X++
	set exposure = $argv[${X}]
	@ X++
	set interval = $argv[${X}]
	@ X++

	set EXPOSURETICKS = `echo "sc=2;$exposure * $rate " | bc`
	@ EXPOSURETICKS = $EXPOSURETICKS:r
     # find the number of ticks in a read pulse at current rate
	
	set INTERVALTICKS = `echo "sc=2;$interval * $rate " | bc`
	@ INTERVALTICKS = $INTERVALTICKS:r
	
	if ( $INTERVALTICKS < 10 ) then
		echo ""
		echo "	WARNING: 	Currently, ScratchNG is limited to a max acquisition rate of ~45Hz (>=22ms exposure or longer)"
		echo ""	
		exit
	endif

	if ( $EXPOSURETICKS  >  $INTERVALTICKS ) then
		echo ""
		echo "	WARNING:	Your exposure is longer than your interval! "
		echo ""
		exit 
	endif

	@ TOTALTICKS = $TOTALTICKS + `echo "sc=2; $sets * $images * $rate * $interval " | bc`
end

# add 100ms to end of protocol
@ TOTALTICKS = ( $TOTALTICKS ) + `echo "sc=2; 200 * $rate " | bc`

if ( ${SHUTTER_A} == 1 ) then
	@ channels++
endif

if ( ${SHUTTER_B} == 1 ) then
	@ channels++
endif

if ( ${SHUTTER_C} == 1 ) then
	@ channels++
endif


# basic setup of the ScratchNG software
echo "# "
echo "# This was generated with the following command line"
echo "# $0 $argv"
echo "# " `date`
echo "# "
echo "# -kdb"
echo "# "
echo "# Some values that the ScratchNG software can use"
echo "# "
echo "# SKIP 0"
echo "# ACQUIRE 1"
echo "# RATE $rate kHz"
echo "# TIME $TOTALTICKS"
echo "# IMAGES $total_images"
echo "# CHANNELS $channels"
if ( $total_images > 800 ) then
	echo "# DISK 1"
	echo "# RAM 0"
else 
	echo "# DISK 0"
	echo "# RAM 1"
endif
echo "# VIEW 1"
echo "# TTLIN off"
echo "# TTLOUT on"
echo "# DA0 off"
echo "# DA1 off"
echo "# DA2 off"
echo "# DA3 off"
echo "# AD0 off"
echo "# AD1 off"
echo "# AD2 off"
echo "# AD3 off"
echo "# AD4 off"
echo "# AD5 off"
echo "# AD6 off"
echo "# AD7 off"
echo "# ANNOTATE on"
echo "# ANNOTATION $0 $argv"
# We need to set up the read pulses to TTL out, which is G2
echo "@WITH G2"
echo "@G2 ON"
echo "@TYPE xy"

@ REALTICKS = 0
@ X = 0
@ PULSE = 0
set SETS = 1
while ( $SETS > 0 )
	@ Y = 1
	while ( $Y < $#argv )

		if ( "$argv[$Y]" == "-sets" ) then
			# only get a new set if it is the first argument.
			if  ( $Y == 1 ) then
				shift
				set SETS = $argv[$Y]
				shift
				if ( $SETS < 1 )  then
					echo " WARNING: -sets is less than 1! "
					exit
				endif
			else
				break
			endif
		endif

		if ( "$argv[$Y]" == "-EPI" ) then
			@ Y++
			@ tirf = $bitlist[$epi_ttl]
        	endif

		if ( "$argv[$Y]" == "-TIRF" ) then
			@ Y++
			@ tirf = $bitlist[$tirf_ttl]
		endif

		# reset image count
		@ X = 0
		@ bracketexposure = 1
		@ shutter_ttl = $argv[$Y]
		@ Y++
		@ shutter_ttl++
		if ("$shutter_ttl" == "0" ) then
			@ shutter     = 0
		else
			if ( "$shutter_ttl" > 10) then
				# adding 10 means we want to keep the shutter open the entire interval, rather than bracketing the exposure
				# but we need to substract 10 to figure out which shutter to use
				@ shutter_ttl -= 10
				set bracketexposure = 0
			endif
			@ shutter     = $bitlist[$shutter_ttl]
			
		endif
		@ filter_ttl  = $argv[$Y]
		if ( "$filter_ttl" > "0" ) then
			@ filter      = $filterlist[$filter_ttl]
		else
			@ filter = 0
		endif
		@ Y++
		@ images      = $argv[$Y]
		@ Y++
		@ exposure    = $argv[$Y]
		@ Y++
		@ interval    = $argv[$Y]
		@ Y++

		set INTERVALTICKS = `echo "sc=2;$interval * $rate " | bc`
		@ INTERVALTICKS = $INTERVALTICKS:r

		set EXPOSURETICKS = `echo "sc=2;$exposure * $rate " | bc`
		@ EXPOSURETICKS = $EXPOSURETICKS:r

		if ( "$bracketexposure" == 1) then
			set SHUTTERTICKS = `echo "sc=2; ( $exposure +  ( $shutter_delay * 2 )) *$rate " | bc`
			@ SHUTTERTICKS = $SHUTTERTICKS:r
			@ open_shutter = $INTERVALTICKS -  $SHUTTERTICKS 
			@ close_shutter = $INTERVALTICKS 
			@ start_exposure = $open_shutter + $shutter_delay
			@ end_exposure = $start_exposure + $EXPOSURETICKS
		else
			set SHUTTERTICKS = 0
			@ open_shutter = $SHUTTERTICKS
			@ close_shutter = $INTERVALTICKS 
			@ start_exposure = $INTERVALTICKS - ( $EXPOSURETICKS +  $shutter_delay )
			@ end_exposure = $INTERVALTICKS - $shutter_delay
		endif
		
		@ ANSWER = 0
		
		while ( $X < $images )
			@ TICKS = 0

			while ( $TICKS < $INTERVALTICKS )
				@ ANSWER = $filter
				@ ANSWER += $tirf
				if ( $TICKS >= $open_shutter ) then
					# open shutter
					if ( $TICKS < $close_shutter ) then
						@ ANSWER += $shutter 
					endif
					if (($TICKS >= $start_exposure) && ( $TICKS <$end_exposure )) then
					@ ANSWER += $read
					endif

				endif
				echo $REALTICKS $ANSWER
				@ TICKS++
				@ REALTICKS++
			end
			@ X++
		end
	end
	@ SETS--
	if ( $SETS == 0 ) then
		# We need to purge everything to find a new -sets option
		@ Y = 1
		while ( $#argv )
			if ( "$1" == "-sets" ) then
				# place holder, will get the real value at the beginning of the first while loop
				@ SETS = 1
				break
			else
				shift
			endif
		end
	endif
end


