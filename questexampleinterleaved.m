clear all 
close all

% es werden 4 thresholds geschätzt
%(dezimalzahlen! in log, die millimeterangaben (nicht stimnamen)

%TGUESS aktuell einfach ein logwert in circa der mitte der range. 
%SD hoch machen , iwie auf max range vllt? oder noch höher
%range kann ich eig weglassen, durch meine einfügungen

%%%%%%%%%%LOG WERTE SIND DIFFERENZWERTE
%%ich lege in unity fest, welcher ref ausgewählt wird (001100110011)
%%und ob up oder down grad gemacht wird (also kleiner oder größere comp
%%genommen wird) (01010101)

  
         StimuliSet = [0.63 1.26 1.89 2.52 3.15 3.78 4.41 5.04 5.67 6.3 6.93 7.56]; 
         maxDiff = 7.56;
         minDiff = 0.63; %%in mm
         
   %%%hier range der distances definieren und stepsize quasi, 
    %%% sodass der umgewandelte stimwert(nicht der log) dann gerundet wird
    %%% zum nächstgelegenen existierend level. 
    tG=0.5; 
    tsd=1; %%
    
    
    %%ACHTUNG WICHTIG
    tprob=0.75;  %%%wegen weibull für fitten für pilotung
    
    
    grain=0.01; 
    beta=3.5;   %% ka man muss man gucken va nachher in simulation. in einem paper nutzen die mit alex 1 oder 1.5, comm ist aber 3.5
   
    delta=0.01; 
    gamma=0.5; 
    range=6.93; 

 q1=QuestCreate(tG,tsd,tprob,beta,delta,gamma,[grain],[range]); %REF X, DOWN STAIRCASE (mit höheren comps vergleich
 
 q2=QuestCreate(tG,tsd,tprob,beta,delta,gamma,[grain],[range]); %REF X, UP STAIRCASE (mit niedrigeren comps vergleich)

 q3=QuestCreate(tG,tsd,tprob,beta,delta,gamma,[grain],[range]); %REF Y, DOWN STAIRCASE (mit höheren comps vergleich

 q4=QuestCreate(tG,tsd,tprob,beta,delta,gamma,[grain],[range]);  %REF Y, UP STAIRCASE (mit niedrigeren comps vergleich)
 
 
    numberOfTrials = 32; % Anything above 32 should be good (müge hat dazu ein paper)
      
        subjnr = input('subjnr?');
        cond = input('condition?');

    %% QUEST Trials
    %=QuestCreate(tGuess,tGuessSd,pThreshold,beta,delta,gamma,[grain],[range])')
        
        for i=1:numberOfTrials
            
            % trials müssen nicht auch noch randomisiert werden, mit 4
            % staircases ist es bereits verwirrend genug. 
            
           
       % in unity ist dann das mit up and down festlegen und welcher ref genommen wird.
       % ref auswahl in settings  0 0 1 1 0 0 1 1 0 0 1 1 
       %up and down settings: 0 1 0 1 0 1 0 1 0 1 0 1 
       
       %dann, sodass weiterhin 1 = comp ist higher frequnt (da wir differenzwert
       %verwenden. also vllt mit korrekt/inkorrekt arbeiten in unity,  immer 0
       %inkorrekt 1 korrekt
       
       % stroke condition: separate applications 
     %  trialnumber 128 pro application 
     
     
     
     %CHECKEN OB DAS BEI Q1 SO OK GEHT UND DANN BEI 2 3 4  AUCH SO AMCHEN
     %IWAS FUNZT NOCH NICHT
        qTest1(i)=round(QuestQuantile(q1),3); 
        %%%ggf qtest1 erst noch iwie SINnVOLL RUNDEN
        qtest1 = 10^qTest1(i);%%eingefügt für log umwandlung
        if qtest1 > maxDiff 
    qtest1 = maxDiff;
        elseif qtest1 < minDiff 
    qtest1 = minDiff;
        end
        qtest1rounded = interp1(StimuliSet,StimuliSet,qtest1,'nearest');
        fprintf('nun kommt FFF XXX');  
        
        
        if qtest1rounded == 0.63
            disp(1);
        end
           if qtest1rounded == 1.26
            disp(2);
           end
          if qtest1rounded == 1.89
            disp(3);
          end  
             if qtest1rounded == 2.52
            disp(4);
             end
          if qtest1rounded == 3.15
            disp(5);
          end
          if qtest1rounded == 3.78
            disp(6);
          end
          if qtest1rounded == 4.41 
            disp(7);
          end
          if qtest1rounded == 5.04
            disp(8);
          end
          if qtest1rounded == 5.67
            disp(9);
          end
          if qtest1rounded == 6.3
            disp(10);
          end
          if qtest1rounded == 6.93
            disp(11);
          end
          if qtest1rounded == 7.56
            disp(12);
        end
        
        
    %    disp(qtest1rounded);%abgeändert zu log ding (grosses T sonst)(und (i) index )
        sicherheitsabfrage=input('vertippt? 0 nein 1 ja');
        if sicherheitsabfrage == 1
        temporaryquestreal=input('was wurde angezeigt');
      
      if temporaryquestreal == 1
        quest_real1 = 0.63;
        end
      if temporaryquestreal == 2
        quest_real1 = 1.26;
        end
      if temporaryquestreal == 3
        quest_real1 = 1.89;
        end
      if temporaryquestreal == 4
        quest_real1 = 2.52;
        end 
        if temporaryquestreal == 5
        quest_real1 = 3.15;
        end
      if temporaryquestreal == 6
        quest_real1 = 3.78;
        end
      if temporaryquestreal == 7
        quest_real1 = 4.41;
        end
      if temporaryquestreal == 8
        quest_real1 = 5.04;
        end 
      if temporaryquestreal == 9
        quest_real1 = 5.67;
        end
      if temporaryquestreal == 10
        quest_real1 = 6.3;
        end
      if temporaryquestreal == 11
        quest_real1 = 6.93;
        end
      if temporaryquestreal == 12
        quest_real1 = 7.56;
        end
        
           else 
              quest_real1 = qtest1rounded;
           end
        quest_real1=log10(quest_real1); %%eingefügt für log umwandlung
         % quest_response1=input('antwort');
         theresponse = input('antwort');
       while theresponse<0 || theresponse>1
    display('Not a valid number please try again')
    theresponse=input('Enter 0  or 1:')
end
       quest_response1=theresponse;
        responses.response1(i) = quest_response1; 
        q1=QuestUpdate(q1,quest_real1,quest_response1); 
        
        
        
        qTest2(i)=round(QuestQuantile(q2),3); 
        qtest2 = 10^qTest2(i);%%eingefügt für log umwandlung
          if qtest2 > maxDiff 
    qtest2 = maxDiff;
        elseif qtest2 < minDiff 
    qtest2 = minDiff;
        end
        qtest2rounded = interp1(StimuliSet,StimuliSet,qtest2,'nearest');
        fprintf('nun kommt FFF XXX');  
        
          
        if qtest2rounded == 0.63
            disp(1);
        end
           if qtest2rounded == 1.26
            disp(2);
           end
          if qtest2rounded == 1.89
            disp(3);
          end  
             if qtest2rounded == 2.52
            disp(4);
             end
          if qtest2rounded == 3.15
            disp(5);
          end
          if qtest2rounded == 3.78
            disp(6);
          end
          if qtest2rounded == 4.41 
            disp(7);
          end
          if qtest2rounded == 5.04
            disp(8);
          end
          if qtest2rounded == 5.67
            disp(9);
          end
          if qtest2rounded == 6.3
            disp(10);
          end
          if qtest2rounded == 6.93
            disp(11);
          end
          if qtest2rounded == 7.56
            disp(12);
        end
        
       % disp(qtest2rounded);%abgeändert zu log ding (grosses T sonst)(und (i) index )
      
         sicherheitsabfrage=input('vertippt? 0 nein 1 ja');
           if sicherheitsabfrage == 1
        temporaryquestreal=input('was wurde angezeigt');
        
              if temporaryquestreal == 1
        quest_real2 = 0.63;
        end
      if temporaryquestreal == 2
        quest_real2 = 1.26;
        end
      if temporaryquestreal == 3
        quest_real2 = 1.89;
        end
      if temporaryquestreal == 4
        quest_real2 = 2.52;
        end 
        if temporaryquestreal == 5
        quest_real2 = 3.15;
        end
      if temporaryquestreal == 6
        quest_real2 = 3.78;
        end
      if temporaryquestreal == 7
        quest_real2 = 4.41;
        end
      if temporaryquestreal == 8
        quest_real2 = 5.04;
        end 
      if temporaryquestreal == 9
        quest_real2 = 5.67;
        end
      if temporaryquestreal == 10
        quest_real2 = 6.3;
        end
      if temporaryquestreal == 11
        quest_real2 = 6.93;
        end
      if temporaryquestreal == 12
        quest_real2 = 7.56;
      end
        
      
           else 
              quest_real2 = qtest2rounded;
           end
        
        quest_real2=log10(quest_real2);%%eingefügt für log umwandlung
        
        theresponse = input('antwort');
       while theresponse<0 || theresponse>1
    display('Not a valid number please try again')
    theresponse=input('Enter 0  or 1:')
end
       quest_response2=theresponse;
        responses.response2(i) = quest_response2; 
        q2=QuestUpdate(q2,quest_real2,quest_response2); 
        
        
        
        qTest3(i)=round(QuestQuantile(q3),3); 
        qtest3 = 10^qTest3(i);%%eingefügt für log umwandlung
          if qtest3 > maxDiff 
    qtest3 = maxDiff;
        elseif qtest3 < minDiff 
    qtest3 = minDiff;
        end
        qtest3rounded = interp1(StimuliSet,StimuliSet,qtest3,'nearest');
        fprintf('nun kommt FFF XXX');   
        
          
        if qtest3rounded == 0.63
            disp(1);
        end
           if qtest3rounded == 1.26
            disp(2);
           end
          if qtest3rounded == 1.89
            disp(3);
          end  
             if qtest3rounded == 2.52
            disp(4);
             end
          if qtest3rounded == 3.15
            disp(5);
          end
          if qtest3rounded == 3.78
            disp(6);
          end
          if qtest3rounded == 4.41 
            disp(7);
          end
          if qtest3rounded == 5.04
            disp(8);
          end
          if qtest3rounded == 5.67
            disp(9);
          end
          if qtest3rounded == 6.3
            disp(10);
          end
          if qtest3rounded == 6.93
            disp(11);
          end
          if qtest3rounded == 7.56
            disp(12);
          end
        
       % disp(qtest3rounded);%abgeändert zu log ding (grosses T sonst)(und (i) index )
        
              sicherheitsabfrage=input('vertippt? 0 nein 1 ja');
           if sicherheitsabfrage == 1
        temporaryquestreal=input('was wurde angezeigt');
        
        
        if temporaryquestreal == 1
        quest_real3 = 0.63;
        end
      if temporaryquestreal == 2
        quest_real3 = 1.26;
        end
      if temporaryquestreal == 3
        quest_real3 = 1.89;
        end
      if temporaryquestreal == 4
        quest_real3 = 2.52;
        end 
        if temporaryquestreal == 5
        quest_real3 = 3.15;
        end
      if temporaryquestreal == 6
        quest_real3 = 3.78;
        end
      if temporaryquestreal == 7
        quest_real3 = 4.41;
        end
      if temporaryquestreal == 8
        quest_real3 = 5.04;
        end 
      if temporaryquestreal == 9
        quest_real3 = 5.67;
        end
      if temporaryquestreal == 10
        quest_real3 = 6.3;
        end
      if temporaryquestreal == 11
        quest_real3 = 6.93;
        end
      if temporaryquestreal == 12
        quest_real3 = 7.56;
      end
        
        
           else 
              quest_real3 = qtest3rounded;
           end
        
        quest_real3=log10(quest_real3);%%eingefügt für log umwandlung
        
            theresponse = input('antwort');
       while theresponse<0 || theresponse>1
    display('Not a valid number please try again')
    theresponse=input('Enter 0  or 1:')
end
       quest_response3=theresponse;
       
        responses.response3(i) = quest_response3; 
        q3=QuestUpdate(q3,quest_real3,quest_response3); 
        
        
        
        
        
     
         qTest4(i)=round(QuestQuantile(q4),3); 
         qtest4 = 10^qTest4(i);%%eingefügt für log umwandlung
           if qtest4 > maxDiff 
    qtest4 = maxDiff;
        elseif qtest4 < minDiff 
    qtest4 = minDiff;
        end
        qtest4rounded = interp1(StimuliSet,StimuliSet,qtest4,'nearest');
        fprintf('nun kommt FFF XXX');   
        
          
        if qtest4rounded == 0.63
            disp(1);
        end
           if qtest4rounded == 1.26
            disp(2);
           end
          if qtest4rounded == 1.89
            disp(3);
          end  
             if qtest4rounded == 2.52
            disp(4);
             end
          if qtest4rounded == 3.15
            disp(5);
          end
          if qtest4rounded == 3.78
            disp(6);
          end
          if qtest4rounded == 4.41 
            disp(7);
          end
          if qtest4rounded == 5.04
            disp(8);
          end
          if qtest4rounded == 5.67
            disp(9);
          end
          if qtest4rounded == 6.3
            disp(10);
          end
          if qtest4rounded == 6.93
            disp(11);
          end
          if qtest4rounded == 7.56
            disp(12);
          end
        
          
       % disp(qtest4rounded);%abgeändert zu log ding (grosses T sonst)(und (i) index )
        
             sicherheitsabfrage=input('vertippt? 0 nein 1 ja');
           if sicherheitsabfrage == 1
        temporaryquestreal=input('was wurde angezeigt');
        
        
              if temporaryquestreal == 1
        quest_real4 = 0.63;
        end
      if temporaryquestreal == 2
        quest_real4 = 1.26;
        end
      if temporaryquestreal == 3
        quest_real4 = 1.89;
        end
      if temporaryquestreal == 4
        quest_real4 = 2.52;
        end 
        if temporaryquestreal == 5
        quest_real4 = 3.15;
        end
      if temporaryquestreal == 6
        quest_real4 = 3.78;
        end
      if temporaryquestreal == 7
        quest_real4 = 4.41;
        end
      if temporaryquestreal == 8
        quest_real4 = 5.04;
        end 
      if temporaryquestreal == 9
        quest_real4 = 5.67;
        end
      if temporaryquestreal == 10
        quest_real4 = 6.3;
        end
      if temporaryquestreal == 11
        quest_real4 = 6.93;
        end
      if temporaryquestreal == 12
        quest_real4 = 7.56;
      end
      
           else 
              quest_real4 = qtest4rounded;
           end
        
        quest_real4=log10(quest_real4);%%eingefügt für log umwandlung
        %%% ggf in log umrechnen damit experimenter "normale zahl" eingeben
        %%% kann
        theresponse = input('antwort');
       while theresponse<0 || theresponse>1
    display('Not a valid number please try again')
    theresponse=input('Enter 0  or 1:')
end
       quest_response4=theresponse; 
        responses.response4(i) = quest_response4; 
        q4=QuestUpdate(q4,quest_real4,quest_response4); 
        
        end
        
        
        
          Thresholds1=QuestMean(q1); 
          Thresholds2=QuestMean(q2); 
          Thresholds3=QuestMean(q3); 
          Thresholds4=QuestMean(q4); 
          
          data.difference(1,:) = q1.intensity(1,1:32);
           data.response(1,:) = q1.response(1,1:32);
            data.difference(2,:) = q2.intensity(1,1:32);
           data.response(2,:) = q2.response(1,1:32);
            data.difference(3,:) = q3.intensity(1,1:32);
           data.response(3,:) = q3.response(1,1:32);
            data.difference(4,:) = q4.intensity(1,1:32);
           data.response(4,:) = q4.response(1,1:32);
        
      save (['Threshold1_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'Thresholds1')
      save (['Threshold2_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'Thresholds2')
      save (['Threshold3_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'Thresholds3')
      save (['Threshold4_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'Thresholds4')
      
      save (['q1_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'q1')
      save (['q2_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'q2')
      save (['q3_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'q3')
      save (['q4_cond' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'q4')
      
       save (['data' num2str(cond) 'VP' num2str(subjnr) '.mat'], 'data')
   
      
      %und am ende werden alle gemittelt basically
      %dann kann ich zb it psignifit psychometric function plotten um mal
      %zu checkenS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%response udn intensity vllt der einfachheit halber nochmal gesondert
%%%abpsoechern
