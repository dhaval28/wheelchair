%Clear Screen
clc;
%Clear Variables
 clear all;
%Close figures
close all;
%Preallocate buffer
data_att = zeros(1,50);
data_med = zeros(1,50);
%Comport Selection
portnum1 = 3;
%COM Port #
comPortName1 = sprintf('\\\\.\\COM%d', portnum1);
% Baud rate for use with TG_Connect() and TG_SetBaudrate().
TG_BAUD_115200 = 115200;
% Data format for use with TG_Connect() and TG_SetDataFormat().
TG_STREAM_PACKETS = 0;
% Data type that can be requested from TG_GetValue().
TG_DATA_ATTENTION = 2;
TG_DATA_MEDITATION = 3;
%load thinkgear dll
loadlibrary('Thinkgear.dll');
%To display in Command Window
fprintf('Thinkgear.dll loaded\n');
% Get a connection ID handle to ThinkGear
connectionId1 = calllib('Thinkgear', 'TG_GetNewConnectionId');
if ( connectionId1 < 0 )
error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId1 ) );
end;
% Attempt to connect the connection ID handle to serial port "COM3"
 errCode = calllib('Thinkgear', 'TG_Connect', connectionId1,comPortName1,TG_BAUD_115200,TG_STREAM_PACKETS );
 if ( errCode < 0 )
 error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
 end
fprintf( 'Connected. Reading Packets...\n' );
i=0;
j=0;
%To display in Command Window
a=arduino('com4')
a.pinMode(3,'output')
a.pinMode(4,'output')
a.pinMode(7,'output')
a.pinMode(8,'output')
a.pinMode(2,'output')
a.pinMode(10,'output')
disp('Reading Brainwaves');
s=0;
att1=0;
att2=0;

med1=0;
med2=0;
sel=1;
next=1;
bl=0;
main