
i=0;
while i < 1
if (calllib('Thinkgear','TG_ReadPackets',connectionId1,1) == 1) %if a packet was read...
if (calllib('Thinkgear','TG_GetValueStatus',connectionId1,TG_DATA_ATTENTION ) ~= 0)
j = j + 1;
%i = i + 1;
%Read attention Valus from thinkgear packets
data_att(j) = calllib('Thinkgear','TG_GetValue',connectionId1,TG_DATA_ATTENTION );
data_med(j) = calllib('Thinkgear','TG_GetValue',connectionId1,TG_DATA_MEDITATION );



%To display in Command Window
if(bl>4)
    
if(sel>8)
    sel=1;
end
switch(sel)
    case 1
         clc;
         fprintf(2,'1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 2
         clc;
         fprintf('1-->Move Forward\n');
         fprintf(2,'2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 3
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf(2,'3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 4
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf(2,'4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 5
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf(2,'5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 6
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf(2,'6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 7
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf(2,'7-->Turn Right\n');
         fprintf('8-->STOP\n');
    case 8
         clc;
         fprintf('1-->Move Forward\n');
         fprintf('2-->STOP\n');
         fprintf('3-->Move Backward\n');
         fprintf('4-->STOP\n');
         fprintf('5-->Turn left\n');
         fprintf('6-->STOP\n');
         fprintf('7-->Turn Right\n');
         fprintf(2,'8-->STOP\n');
end

if((data_att(j)) > 1)
    switch(next)
        case 1
            att1=data_att(j);
            med1=data_med(j);
            next=2;
  
        case 2
            att2=data_att(j);
            med2=data_med(j);
            next=1;
    end
         
end
if(att1==att2 && med1==med2)
    clc;
   fprintf('Raised Eyebrow!!!!\n'); 
if(sel==1 || sel==3 || sel==5 || sel==7)
    fprintf('Stopped!!!');
    stop
end
if(sel==2)
    fprintf('Forward!!!');
    move_forward
    
end
if(sel==4)
    fprintf('Backward!!!');
    move_backward
    
end
if(sel==6)
    turn_left
    fprintf('Left!!!');
end
if(sel==8)
    fprintf('Right!!!');
    turn_right
    
end

end
sel=sel+1;
if((data_med(j))>70)
    a.digitalWrite(2,1)
end
if((data_med(j))<70)
    a.digitalWrite(2,0)
end

if((data_att(j))>60)
    a.digitalWrite(10,1)
end
if((data_att(j))<60)
    a.digitalWrite(10,0)
end
end
bl=bl+1;


pause(0.2);
end
end
end
%To display in Command Window
disp('Loop Completed')

%Release the comm port
calllib('Thinkgear', 'TG_FreeConnection', connectionId1 );