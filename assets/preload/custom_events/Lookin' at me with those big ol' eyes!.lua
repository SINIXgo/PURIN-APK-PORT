local staring = false;

--THE HELL ARE YOU LOOKING AT????
local noteshitt = {
     --Opponent notes below.
	 {
	    note = 0,
		value = 412,
		middlescroll = 82,
		normal = 92,
		alphamiddle = 0.35,
		alpha = 1
	 },
	 {
	    note = 1,
		value = 524,
		middlescroll = 194,
		normal = 204,
		alphamiddle = 0.35,
		alpha = 1
	 },
	 {
	    note = 2,
		value = 636,
		middlescroll = 971,
		normal = 316,
		alphamiddle = 0.35,
		alpha = 1
     },
	 {
	    note = 3,
		value = 748,
		middlescroll = 1083,
		normal = 428,
		alphamiddle = 0.35,
		alpha = 1
	 },
	 --Player notes below.
     {
	    note = 4,
		value = 412,
		middlescroll = 412,
		normal = 732,
		alphamiddle = 1,
		alpha = 0
	 },
	 {
	    note = 5,
		value = 524,
		middlescroll = 524,
		normal = 844,
		alphamiddle = 1,
		alpha = 0
	 },
	 {
	    note = 6,
		value = 636,
		middlescroll = 636,
		normal = 956,
		alphamiddle = 1,
		alpha = 0
	 },
	 {
	    note = 7,
		value = 748,
		middlescroll = 748,
		normal = 1068,
		alphamiddle = 1,
		alpha = 0
	 }
};

function onEvent(name, value1)
   if name == "Lookin' at me with those big ol' eyes!" then
      if value1 == 'start' then
         setProperty('noteKillOffset', 1000);
		 
	     staring = true;
		 
		 setPropertyFromGroup('strumLineNotes', 0, 'direction', -90);
		 setPropertyFromGroup('strumLineNotes', 1, 'direction', -90);
		 setPropertyFromGroup('strumLineNotes', 2, 'direction', -90);
		 setPropertyFromGroup('strumLineNotes', 3, 'direction', -90);
	     
		 for i = 1, #noteshitt do
		    noteTweenX('note' .. i, noteshitt[i].note, noteshitt[i].value, 0.8, 'cubeInOut') 
			
			noteTweenAlpha('notealpha' .. i, noteshitt[i].note, noteshitt[i].alpha, 0.8, 'quadInOut');
		 end
      end
	  
	  if value1 == 'stop' then
	     setProperty('noteKillOffset', 350);	
		 
	     staring = false;
		 
		 setPropertyFromGroup('strumLineNotes', 0, 'direction', 90);
		 setPropertyFromGroup('strumLineNotes', 1, 'direction', 90);
		 setPropertyFromGroup('strumLineNotes', 2, 'direction', 90);
		 setPropertyFromGroup('strumLineNotes', 3, 'direction', 90)
		 
		 for i = 1, #noteshitt do
		   if not middlescroll then
			  noteTweenAlpha('notealpha' .. i, noteshitt[i].note, 1, 0.8, 'quadInOut');
			   
		      noteTweenX('note' .. i, noteshitt[i].note, noteshitt[i].normal, 0.8, 'cubeInOut');
		   elseif middlescroll then
		      noteTweenX('note' .. i, noteshitt[i].note, noteshitt[i].middlescroll, 0.8, 'cubeInOut');
				  
			  noteTweenAlpha('notealpha' .. i, noteshitt[i].note, noteshitt[i].alphamiddle, 0.8, 'quadInOut');
		   end
	    end
     end
   end
end